import 'package:flutter/material.dart';
import 'package:fudeo_tales/misc/constants.dart';
import 'package:fudeo_tales/pages/iap_products_page.dart';

class LockedPage extends StatelessWidget {
  const LockedPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFCFFFDC),
          title: const Text('ABBONATI'),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(2.0),
            child: Divider(
              height: 0,
              color: Colors.black26,
            ),
          ),
        ),
        body: Container(
          color: const Color(0xFFCFFFDC),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  K.assetLocked,
                  height: 300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Questo contenuto è bloccato',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'Hai consumato tutti i contenuti gratuiti disponibili. Per visualizzare questo contenuto devi acquistare un abbonamento Premium.',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const IAPProductsPage(),
                        ),
                      ),
                      child: const Text(
                        'ACQUISTA',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
