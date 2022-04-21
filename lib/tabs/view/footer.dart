import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage(AppConstants.footerBackgroundPath),
        ),
      ),
    );
  }
}
