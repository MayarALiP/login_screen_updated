

import 'package:flutter/material.dart';

class CenterdLogo extends StatelessWidget {
  const CenterdLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.white12,
                radius: 55.0,
                child: FractionalTranslation(
                  translation: const Offset(0.0, -0.5),
                  child: Image.asset(
                    "assets/images/orange_logo.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            FractionalTranslation(
              translation: const Offset(0.5, 0.75),
              child: Image.asset("assets/images/fontLogo.png",
                fit: BoxFit.scaleDown,),
            ),
          ]),
    );
  }
}
