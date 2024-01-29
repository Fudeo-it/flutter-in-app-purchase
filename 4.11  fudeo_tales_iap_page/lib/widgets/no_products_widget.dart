import 'package:flutter/material.dart';
import 'package:fudeo_tales/misc/constants.dart';

class NoProductsWidget extends StatelessWidget {
  const NoProductsWidget({super.key});

  @override
  Widget build(BuildContext context) => Opacity(
    opacity: 0.5,
    child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              K.assetPurchases,
              height: 150.0,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                'Nessun prodotto disponibile',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
  );
}
