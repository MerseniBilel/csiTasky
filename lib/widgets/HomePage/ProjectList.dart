import 'package:csitasky/models/Project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../globals.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({
    Key? key,
    required this.allProjects,
    required this.height,
    required this.width,
  }) : super(key: key);

  final Future<List<Project>> allProjects;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: allProjects,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Container(
            height: height * 0.25,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int i) {
                return Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12.0),
                  width: width * .70,
                  margin: EdgeInsets.all(3.0),
                  height: height * 0.25,
                  child: Center(
                    child: SpinKitDoubleBounce(
                      color: kPurpleColor,
                      size: 30.0,
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Container(
            height: height * 0.25,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final item = snapshot.data[index];
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/details',
                      arguments: {'item': item}),
                  child: OneProject(width: width, height: height, item: item),
                );
              },
            ),
          );
        }
      },
    );
  }
}

class OneProject extends StatelessWidget {
  const OneProject({
    Key? key,
    required this.width,
    required this.height,
    required this.item,
  }) : super(key: key);

  final double width;
  final double height;
  final item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12.0),
      width: width * .70,
      margin: EdgeInsets.all(3.0),
      height: height * 0.25,
      decoration: BoxDecoration(
          color: kPurpleColor, borderRadius: BorderRadius.circular(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text(
              item.projectName,
              style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.headline6,
                fontWeight: FontWeight.bold,
                color: kprojectnameColor,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                item.projectDesc,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400,
                  color: kprojectnameColor,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Project Owner :',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    color: kprojectnameColor,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1493666438817-866a91353ca9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1049&q=80'),
                ),
                Text(
                  item.projectOwner.email,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    color: kprojectnameColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Center(
              child: Text(
                item.started ? 'Started' : 'Pending',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.headline6,
                  fontWeight: FontWeight.bold,
                  color: kprojectnameColor,
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
