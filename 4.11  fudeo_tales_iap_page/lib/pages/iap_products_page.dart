import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudeo_tales/blocs/product/product_bloc.dart';
import 'package:fudeo_tales/blocs/purchase/purchase_bloc.dart';
import 'package:fudeo_tales/cubits/subscriptions_cubit.dart';
import 'package:fudeo_tales/misc/constants.dart';
import 'package:fudeo_tales/widgets/no_products_widget.dart';
import 'package:fudeo_tales/widgets/product_widget.dart';
import 'package:loader_overlay/loader_overlay.dart';

class IAPProductsPage extends StatefulWidget {
  const IAPProductsPage({super.key});

  @override
  State<IAPProductsPage> createState() => _IAPProductsPageState();
}

class _IAPProductsPageState extends State<IAPProductsPage> {
  @override
  void initState() {
    super.initState();

    context.read<ProductBloc>().fetch(K.iapProducts);
  }

  @override
  Widget build(BuildContext context) => MultiBlocListener(
        listeners: [
          BlocListener<PurchaseBloc, PurchaseState>(
            listener: (context, state) => switch (state) {
              CompletingPurchaseState() => context.loaderOverlay.show(),
              CompletedPurchaseState() => _onIAPCompleted(context),
              ErrorCompletingPurchaseState() => _onBuyingError(context),
              _ => null,
            },
          ),
          BlocListener<ProductBloc, ProductState>(
            listener: (context, state) => switch (state) {
              BuyingProductState() => context.loaderOverlay.show(),
              BoughtProductState() => context.loaderOverlay.hide(),
              ErrorBuyingProductState() => _onBuyingError(context),
              _ => null,
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFFC6C0FC),
            title: const Text('ACQUISTI'),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(2.0),
              child: Divider(
                height: 0,
                color: Colors.black26,
              ),
            ),
          ),
          body: Container(
            color: const Color(0xFFC6C0FC),
            child: BlocBuilder<ProductBloc, ProductState>(
              buildWhen: (_, state) => switch (state) {
                FetchingProductState() => true,
                FetchedProductState() => true,
                ErrorFetchingProductState() => true,
                NoProductState() => true,
                _ => false,
              },
              builder: (context, state) => switch (state) {
                FetchingProductState() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                NoProductState() => const Center(
                    child: NoProductsWidget(),
                  ),
                FetchedProductState(:final products) =>
                  BlocBuilder<SubscriptionsCubit, Set<String>>(
                    builder: (context, subscriptions) => ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 8.0,
                      ),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        final consumable =
                            !K.iapNonConsumableProducts.contains(product.id);
                        final paid = subscriptions.contains(product.id);

                        return ProductWidget(
                          product,
                          consumable: consumable,
                          paid: paid,
                          onPressed: () => context.read<ProductBloc>().buy(
                                product,
                                consumable: consumable,
                              ),
                        );
                      },
                      separatorBuilder: (_, __) => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Divider(height: 0),
                      ),
                      itemCount: products.length,
                    ),
                  ),
                _ => const SizedBox.shrink(),
              },
            ),
          ),
        ),
      );

  void _onIAPCompleted(BuildContext context) {
    context.loaderOverlay.hide();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Acquisto completato'),
          content: const Text(
              'L\'acquisto di questo prodotto è andato a buon fine!'),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }

  void _onBuyingError(BuildContext context) {
    context.loaderOverlay.hide();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Errore durante l\'acquisto'),
          content: const Text(
              'Si è verificato un errore durante l\'acquisto di questo prodotto. Ti preghiamo di riprovare più tardi.'),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
