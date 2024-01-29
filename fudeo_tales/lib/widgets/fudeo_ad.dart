import 'package:flutter/material.dart';
import 'package:fudeo_tales/misc/constants.dart';

class FudeoAd extends StatelessWidget {
  final GestureTapCallback? onPressed;
  final GestureTapCallback? onDismissed;

  const FudeoAd({
    super.key,
    this.onPressed,
    this.onDismissed,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 36.0,
          ),
          color: Colors.black,
          width: double.maxFinite,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      K.assetLogo,
                      height: 28.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Scopri l\'academy',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: onDismissed,
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 36.0,
                ),
              ),
            ],
          ),
        ),
      );
}
