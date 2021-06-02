import 'package:csitasky/widgets/WelcomePage/Header.dart';
import 'package:csitasky/widgets/WelcomePage/MainContent.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.03,
          horizontal: height * 0.02,
        ),
        child: Column(
          children: [
            Header(
              logo: Icons.receipt_long_outlined,
              title: 'csiTasky',
            ),
            MainContent(height: height, width: width)
          ],
        ),
      )),
    );
  }
}

/*
font style using google font

GoogleFonts.montserrat(
            textStyle: Theme.of(context).textTheme.headline3,
            color: kTestColor,
            fontWeight: FontWeight.w700,
          ),

          Icon(
  Icons.receipt_long_outlined,
),

*/
