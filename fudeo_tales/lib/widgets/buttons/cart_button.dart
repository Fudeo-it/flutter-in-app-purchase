import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final GestureTapCallback? onPressed;

  const CartButton({
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.shopping_cart_outlined,
        ),
      );
}
