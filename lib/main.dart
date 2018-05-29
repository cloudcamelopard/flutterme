import 'package:flutter/material.dart';

main() => runApp(FlutterMeApp());

class FlutterMeApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Me",
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Flutter Me"),
        ),
        body: Column(
          children: <Widget>[
            Head(),
            Body(),
            Legs(),
        ])
      ),
    );
  }
}

class Head extends BodyPart {
  Head():super('head');
}

class Body extends BodyPart {
  Body():super('body');
}

class Legs extends BodyPart {
  Legs():super('legs');
}

abstract class BodyPart extends StatefulWidget {
  final String part;
  BodyPart(this.part);
  @override
  _BodyPartState createState() {
    return _BodyPartState(part);
  }
}

class _BodyPartState extends State<BodyPart> {
  int _variation = 1;
  String _part;
  void _change() {
    setState(() {
      _variation = (_variation % 12) + 1;
    });
  }
  _BodyPartState(String part) {
    _part = part;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      color: Colors.white,
      child: FlatButton(
        highlightColor: Colors.white,
        //disabledColor: Colors.white,
        splashColor: Colors.white,
        color: Colors.white,
        child: Image.asset('graphics/$_part$_variation.png'),
        onPressed: _change,
      )
    );
  }
}

enum Part {
  head, body, legs
}