import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../globals.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.userName,
    required this.userRole,
  }) : super(key: key);

  final String userName;
  final String userRole;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.headline5,
                fontWeight: FontWeight.w600,
                color: kTestColor,
              ),
            ),
            Text(
              userRole,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                color: kTestColor2,
              ),
            ),
          ],
        ),
        Icon(
          Icons.notifications_outlined,
          color: kPurpleColor,
          size: 28,
        )
      ],
    ));
  }
}
