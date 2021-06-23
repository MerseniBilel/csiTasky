import 'dart:convert';

import 'package:csitasky/globals.dart';
import 'package:csitasky/widgets/Loading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _thereIsanError = false;
  // login fuction :
  singIn(String email, String passwod) async {
    print(email);
    print(passwod);
    var url = Uri.parse(endpoint + 'api/v2/mobile');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final data = jsonEncode({"email": email, "password": passwod});

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    var jsonResponse;
    var res = await http.post(url, body: data, headers: headers);
    if (res.statusCode == 200) {
      jsonResponse = json.decode(res.body);
      setState(() {
        _thereIsanError = false;
      });
      Navigator.pushNamed(context, '/home',
          arguments: {'mydata': jsonResponse});
    } else {
      print("a problem is apper ${res.statusCode}");
      setState(() {
        _thereIsanError = true;
      });
    }

    if (jsonResponse != null) {
      sharedPreferences.setString('token', jsonResponse['token']);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return _isLoading
        ? Loading()
        : Scaffold(
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.08,
                  horizontal: height * 0.02,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          'Welcome Back 👋',
                          style: GoogleFonts.montserrat(
                            textStyle: Theme.of(context).textTheme.headline4,
                            color: kTestColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Start changing the timeline of life regulary in order to increase your productivity.',
                          style: GoogleFonts.montserrat(
                            color: kTestColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 60.0),
                        height: height * 0.2,
                        child: Center(
                          child: Image(
                            fit: BoxFit.fitHeight,
                            image: AssetImage(
                              loginImage,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 60.0),
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                _thereIsanError ? 'Check your credentials' : '',
                                style:
                                    GoogleFonts.montserrat(color: Colors.red),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 7), // changes position of shadow
                                  ),
                                ],
                                color: kOtherWite,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  focusColor: kMustardColor,
                                  helperStyle: GoogleFonts.montserrat(
                                    color: kTestColor2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  hintText: 'Username / email',
                                  icon: Icon(
                                    Icons.person_outlined,
                                    color: kPurpleColor,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 7), // changes position of shadow
                                  ),
                                ],
                                color: kOtherWite,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: TextField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  focusColor: kMustardColor,
                                  helperStyle: GoogleFonts.montserrat(
                                    color: kTestColor2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  hintText: 'Password',
                                  icon: Icon(
                                    Icons.lock_outlined,
                                    color: kPurpleColor,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Container(
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                  color: kPurpleColor,
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: TextButton(
                                // ignore: unrelated_type_equality_checks
                                onPressed: _emailController.text == "" ||
                                        // ignore: unrelated_type_equality_checks
                                        _passwordController.text == ""
                                    ? null
                                    : () {
                                        setState(() {
                                          _isLoading = true;
                                        });
                                        singIn(_emailController.text,
                                            _passwordController.text);
                                      },
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
