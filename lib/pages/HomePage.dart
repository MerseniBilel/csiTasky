import 'package:csitasky/globals.dart';
import 'package:csitasky/models/Profile.dart';
import 'package:csitasky/models/Project.dart';
import 'package:csitasky/models/Task.dart';
import 'package:csitasky/models/slideup.dart';
import 'package:csitasky/widgets/HomePage/Header.dart';
import 'package:csitasky/widgets/HomePage/ProjectList.dart';
import 'package:csitasky/widgets/HomePage/SearchTask.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Project>> allProjects;

  Future<List<Project>> fetchProjects() async {
    final response = await http.get(Uri.parse(
        endpoint + 'api/v2/mobile/projects/60d226b6d78552406c74b657'));
    if (response.statusCode == 200) {
      return projectFromJson(response.body);
    } else {
      throw Exception('Failed to load projects');
    }
  }

  @override
  void initState() {
    super.initState();
    allProjects = fetchProjects();
  }

  @override
  Widget build(BuildContext context) {
    // get args
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final resopnse = args['mydata'];
    Profile profileData = Profile.fromJson(resopnse);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 50,
        maxHeight: height - 120,
        panel: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 6,
                  width: width / 4,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 15, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Team Member',
                      style: GoogleFonts.montserrat(
                        color: kTestColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Active',
                          style: GoogleFonts.montserrat(
                            color: kTestColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.verified,
                          size: 20,
                          color: Colors.green,
                        ),
                      ],
                    ),
                    Text(
                      '2021-06-22',
                      style: GoogleFonts.montserrat(
                        color: kTestColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Name : ',
                          style: GoogleFonts.montserrat(
                            color: kTestColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          profileData.user.name,
                          style: GoogleFonts.montserrat(
                            color: kTestColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lastname : ',
                          style: GoogleFonts.montserrat(
                            color: kTestColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          profileData.user.lastname,
                          style: GoogleFonts.montserrat(
                            color: kTestColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Email : ',
                          style: GoogleFonts.montserrat(
                            color: kTestColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          profileData.user.email,
                          style: GoogleFonts.montserrat(
                            color: kTestColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Phone : ',
                          style: GoogleFonts.montserrat(
                            color: kTestColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          profileData.user.phoneNumber,
                          style: GoogleFonts.montserrat(
                            color: kTestColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15.0, top: 15),
                child: Text(
                  'About Me',
                  style: GoogleFonts.montserrat(
                    color: kTestColor,
                    fontWeight: FontWeight.w500,
                    textStyle: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 25.0, top: 10),
                child: Text(
                  'I enjoy being challenged and engaging with projects that require me to work outside my comfort and knowledge set, as continuing to learn new languages and development techniques are important to me and the success of your organization.',
                  style: GoogleFonts.montserrat(
                    color: kTestColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 300,
                  child: Image.asset(about, fit: BoxFit.fitHeight),
                ),
              )
            ],
          ),
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
                  userName:
                      '${profileData.user.lastname} ${profileData.user.name}',
                  userRole: 'Team Member'),
              SearchTask(height: height),
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
              ProjectList(
                  allProjects: allProjects, height: height, width: width),
              Mytasks(),
            ],
          ),
        )),
      ),
    );
  }
}

class Mytasks extends StatefulWidget {
  const Mytasks({
    Key? key,
  }) : super(key: key);

  @override
  _MytasksState createState() => _MytasksState();
}

class _MytasksState extends State<Mytasks> {
  late Future<List<Task>> alltasks;

  Future<List<Task>> fetchTasks() async {
    final response = await http.get(
        Uri.parse(endpoint + 'api/v2/mobile/tasks/60d226b6d78552406c74b657'));
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
      height: 362,
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
