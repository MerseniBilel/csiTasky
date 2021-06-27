import 'package:csitasky/globals.dart';
import 'package:csitasky/models/Task.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final projectdesc = args['item'];
    print(projectdesc.id);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back_ios,
          size: 25,
          color: Colors.black,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              projectdesc.projectName,
              style: GoogleFonts.montserrat(
                  color: kTestColor,
                  fontWeight: FontWeight.w600,
                  textStyle: Theme.of(context).textTheme.headline5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 150,
                  child: Stack(
                    children: [
                      Positioned(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1493666438817-866a91353ca9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1049&q=80'),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80'),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80'),
                        ),
                      ),
                      Positioned(
                        left: 75,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Startet At',
                        style: GoogleFonts.montserrat(
                          color: kTestColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.event_outlined,
                            size: 25,
                            color: kPurpleColor,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '2021-06-22',
                            style: GoogleFonts.montserrat(
                              color: kTestColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.schedule_outlined,
                            size: 25,
                            color: kPurpleColor,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '18:32',
                            style: GoogleFonts.montserrat(
                              color: kTestColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Attachment',
                  style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.headline6,
                    color: kTestColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'See all',
                  style: GoogleFonts.montserrat(
                      color: kPurpleColor, fontWeight: FontWeight.w300),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              width: width,
              decoration: BoxDecoration(
                color: kPurpleColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                leading: Icon(
                  Icons.find_in_page_outlined,
                  size: 35,
                  color: kOtherWite,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Project description.pdf',
                      style: GoogleFonts.montserrat(
                          color: kOtherWite, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'size 12.3mb',
                      style: GoogleFonts.montserrat(
                          color: kOtherWite, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Text(
                'ToDo',
                style: GoogleFonts.montserrat(
                    color: kTestColor,
                    fontWeight: FontWeight.w600,
                    textStyle: Theme.of(context).textTheme.headline5),
              ),
            ),
            Mytasks2()
          ],
        ),
      ),
    );
  }
}

class Mytasks2 extends StatefulWidget {
  const Mytasks2({
    Key? key,
  }) : super(key: key);

  @override
  _MytasksState createState() => _MytasksState();
}

class _MytasksState extends State<Mytasks2> {
  late Future<List<Task>> alltasks;

  Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse(endpoint + 'api/v2/mobile/desc'));
    if (response.statusCode == 200) {
      return taskFromJson(response.body);
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  @override
  void initState() {
    super.initState();
    alltasks = fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 490,
      child: FutureBuilder(
          future: alltasks,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Text('loading');
            } else {
              return Container(
                height: 362,
                child: ListView.separated(
                  itemCount: snapshot.data.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    final item = snapshot.data[index];
                    void dismissItem(BuildContext context, int index,
                        DismissDirection direction) {
                      setState(() {
                        snapshot.data.removeAt(index);
                      });
                    }

                    return Dismissible(
                      onDismissed: (direction) =>
                          dismissItem(context, index, direction),
                      key: ObjectKey(item),
                      background: Container(
                        alignment: Alignment.centerRight,
                        color: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Icon(
                          Icons.delete_forever,
                          color: Colors.white,
                        ),
                      ),
                      child: Alltasks(item: item),
                    );
                  },
                ),
              );
            }
          }),
    );
  }
}

class Alltasks extends StatelessWidget {
  const Alltasks({
    Key? key,
    required this.item,
  }) : super(key: key);

  final item;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: item.completed
            ? Icon(
                Icons.check_circle_outline,
                size: 32.0,
                color: Colors.green,
              )
            : Icon(
                Icons.toc_rounded,
                size: 32.0,
                color: kPurpleColor,
              ),
        onTap: () {},
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.task,
              style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.headline6,
                color: kTestColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              item.description,
              style: GoogleFonts.montserrat(
                color: kTestColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
