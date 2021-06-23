import 'dart:convert';

import 'package:csitasky/globals.dart';
import 'package:csitasky/models/Profile.dart';
import 'package:csitasky/models/homeData.dart';
import 'package:csitasky/widgets/HomePage/Header.dart';
import 'package:csitasky/widgets/HomePage/ProjectScroller.dart';
import 'package:csitasky/widgets/HomePage/SearchTask.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final resopnse = args['mydata'];
    final responseData = resopnse['respomseData']['data'];
    var jsonresponse = json.encode(responseData);

    List<Homedata> listofhomedata = homedataFromJson(jsonresponse);
    print(listofhomedata);

    Profile profileData = Profile.fromJson(resopnse['respomseData']['profile']);
    print(profileData.runtimeType);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(
          Icons.attach_file,
          color: kWhiteColor,
        ),
        backgroundColor: kPurpleColor,
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.03,
          horizontal: height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
                userName: '${profileData.name} ${profileData.lastname}',
                userRole: 'Team Member'),
            SearchTask(height: height),
            ProjectScroller(height: height, width: width),
            DailyTasks(heigh: height, width: width)
          ],
        ),
      )),
    );
  }
}

class DailyTasks extends StatelessWidget {
  const DailyTasks({
    Key? key,
    required this.width,
    required this.heigh,
  }) : super(key: key);
  final double width;
  final double heigh;
  @override
  Widget build(BuildContext context) {
    var myDaylyTasks = <Map>[]; // creates an empty List<Map>
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Task List',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.headline6,
                  color: kTestColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'edit',
                style: GoogleFonts.montserrat(
                    color: kPurpleColor, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Container(
              height: heigh * 0.32,
              child: myDaylyTasks.length == 0
                  ? Image.asset(noTasks, fit: BoxFit.fitHeight)
                  : Text('bilel'))
        ],
      ),
    );
  }
}
