import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../globals.dart';

class SearchTask extends StatelessWidget {
  const SearchTask({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: height * 0.05),
      padding: EdgeInsets.symmetric(horizontal: height * 0.02),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 7), // changes position of shadow
          ),
        ],
        color: kOtherWite,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          focusColor: kMustardColor,
          helperStyle: GoogleFonts.montserrat(
            color: kTestColor2,
            fontWeight: FontWeight.w400,
          ),
          hintText: 'Search Task',
          icon: Icon(
            Icons.search_outlined,
            color: kMustardColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
