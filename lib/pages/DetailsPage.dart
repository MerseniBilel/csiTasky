import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Object? get id => null;

  @override
  void initState() {
    super.initState();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final id = args['id'];
    print(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
