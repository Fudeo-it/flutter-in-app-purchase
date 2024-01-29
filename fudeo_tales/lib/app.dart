import 'package:flutter/material.dart';
import 'package:fudeo_tales/di/dependency_injector.dart';
import 'package:fudeo_tales/pages/home_page.dart';
import 'package:fudeo_tales/routing/my_route_observer.dart';
import 'package:fudeo_tales/widgets/iap_purchase_handler.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => DependencyInjector(
        child: Builder(
          builder: (context) => GlobalLoaderOverlay(
            child: IAPPurchaseHandler(
              child: MaterialApp(
                navigatorObservers: [
                  MyRouteObserver(
                    subscriptionsCubit: context.read(),
                    navigationCounterCubit: context.read(),
                  ),
                ],
                debugShowCheckedModeBanner: false,
                title: 'Fudeo Tales',
                theme: ThemeData(
                  useMaterial3: false,
                  appBarTheme: const AppBarTheme(
                    elevation: 0,
                    toolbarHeight: 96.0,
                    centerTitle: true,
                    color: Colors.transparent,
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      letterSpacing: 4.0,
                      fontWeight: FontWeight.w800,
                    ),
                    iconTheme: IconThemeData(
                      size: 24.0,
                      color: Colors.black,
                    ),
                  ),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      backgroundColor: const Color(0xFFFBDE7F),
                      elevation: 0,
                      textStyle: const TextStyle(fontSize: 16.0,),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 48.0,
                      ),
                    ),
                  ),
                ),
                home: const HomePage(),
              ),
            ),
          ),
        ),
      );
}
