import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/size.dart';

class AppBarTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const AppBarTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DefaultResponsiveSizes(context).kDefaultHeight / 8,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            appBarText(title, 48.00),
            appBarText(subtitle, 24.00),
          ],
        ),
      ),
    );
  }

  Text appBarText(viewModelText, double fontSize) {
    return Text(
      viewModelText,
      style: GoogleFonts.ubuntu(
        textStyle: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
