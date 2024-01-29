import 'package:flutter/material.dart';
import 'package:fudeo_tales/misc/constants.dart';

class ZigZagDivider extends StatelessWidget {
  const ZigZagDivider({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          children: [
            const Expanded(
              child: Divider(
                color: Colors.black,
                thickness: 2.5,
              ),
            ),
            Image.asset(
              K.assetDivider,
              height: 20.0,
            ),
            const Expanded(
              child: Divider(
                color: Colors.black,
                thickness: 2.5,
              ),
            ),
          ],
        ),
      );
}
