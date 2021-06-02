import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../globals.dart';

class ProjectScroller extends StatelessWidget {
  const ProjectScroller({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Project',
                  style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.headline6,
                    color: kTestColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'See all',
                  style: GoogleFonts.montserrat(
                      color: kPurpleColor, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.25,
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 12.0),
                      width: width * .70,
                      margin: EdgeInsets.all(3.0),
                      height: height * 0.25,
                      decoration: BoxDecoration(
                          color: index % 2 == 0 ? kPurpleColor : kMustardColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Text(
                              'Medical Dashboard Ui',
                              style: GoogleFonts.montserrat(
                                textStyle:
                                    Theme.of(context).textTheme.headline6,
                                fontWeight: FontWeight.bold,
                                color: kprojectnameColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // team member
                                Container(
                                  width: width * 0.30,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://images.unsplash.com/photo-1493666438817-866a91353ca9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1049&q=80'),
                                        ),
                                      ),
                                      Positioned(
                                        left: 20,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
                                        ),
                                      ),
                                      Positioned(
                                        left: 40,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://images.unsplash.com/photo-1613145997970-db84a7975fbb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=658&q=80'),
                                        ),
                                      ),
                                      Positioned(
                                        left: 60,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://images.unsplash.com/photo-1541119370235-6c11470cfb1e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // started day and the number of my task it's a column widget
                                Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        '🕒\t 21-05-2021',
                                        style: GoogleFonts.montserrat(
                                          color: kWhiteColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        '🕘\t 10 tasks     ',
                                        style: GoogleFonts.montserrat(
                                          color: kWhiteColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // progerss bar
                          Container(
                            margin: EdgeInsets.only(top: 25.0),
                            child: Stack(
                              children: [
                                Container(
                                  height: 10,
                                  width: width,
                                  decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                Container(
                                  height: 10,
                                  width: width * .5,
                                  decoration: BoxDecoration(
                                    color: index % 2 == 0
                                        ? kMustardColor
                                        : kPurpleColor,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Progress',
                                style: GoogleFonts.montserrat(
                                  color: kOtherWite,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '80%',
                                style: GoogleFonts.montserrat(
                                  color: kOtherWite,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ));
                }),
          )
        ],
      ),
    );
  }
}
