import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../globals.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.logo,
    required this.title,
  }) : super(key: key);
  final IconData logo;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            logo,
            color: kPurpleColor,
            size: 28,
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            '$title',
            style: GoogleFonts.montserrat(
                color: kTestColor,
                fontWeight: FontWeight.w600,
                textStyle: Theme.of(context).textTheme.headline6),
          )
        ],
      ),
    );
  }
}
