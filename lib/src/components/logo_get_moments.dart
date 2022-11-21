import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart' as colors;

class LogoGetMoments extends StatelessWidget {
  const LogoGetMoments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'get.',
            style: GoogleFonts.roboto(
              fontSize: 40,
              fontWeight: FontWeight.w200,
              color: colors.customWhite,
            ),
          ),
          Text(
            'Moments',
            style: GoogleFonts.roboto(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: colors.customWhite,
            ),
          ),
        ],
      ),
    );
  }
}
