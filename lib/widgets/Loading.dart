import 'dart:io';

import 'package:csitasky/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      child: SpinKitDoubleBounce(
        color: kPurpleColor,
        size: 70.0,
      ),
    );
  }
}
