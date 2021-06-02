import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../globals.dart';

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.04),
      child: Column(
        children: [
          Text(
            'Start enjoying a more organized work life✨',
            style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.headline4,
                color: kTestColor,
                fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            child: Text(
              'Start changing the timeline of life regulary in order to increase your productivity.',
              style: GoogleFonts.montserrat(
                color: kTestColor,
                fontWeight: FontWeight.w300,
                fontSize: 15.0,
              ),
            ),
          ),
          Stack(children: [
            Container(
              width: width,
              height: height * 0.5,
              child: Image.asset(welcome3d, fit: BoxFit.fitHeight),
            ),
            Container(
              width: 100,
              height: 100,
              child: Image.asset(welcome3d2),
            ),
          ]),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: width * 0.4,
              decoration: BoxDecoration(
                  color: kPurpleColor,
                  borderRadius: BorderRadius.circular(50.0)),
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/home'),
                child: Text(
                  'Get Started',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
