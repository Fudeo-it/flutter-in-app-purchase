import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class ProductWidget extends StatelessWidget {
  final ProductDetails product;
  final bool paid;
  final bool consumable;
  final GestureTapCallback? onPressed;

  const ProductWidget(
    this.product, {
    super.key,
    this.paid = false,
    this.consumable = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: !paid ? onPressed : null,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 48.0,
              width: 48.0,
              child: Stack(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xFF615b9a),
                    radius: 24.0,
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                    ),
                  ),
                  if (consumable)
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 8.0,
                        child: Icon(
                          Icons.refresh,
                          color: Colors.white,
                          size: 12.0,
                        ),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
        title: Text(
          product.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            product.description,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              paid ? 'Attivo' : product.price,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      );
}
