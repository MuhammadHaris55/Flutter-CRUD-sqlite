import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

//FOR FLUTTER CRUD APP SQLITE ----------------STARTS ---------------------------
const darkBlueColor = Color(0xff486579);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact App',
      theme: ThemeData(
        primaryColor: darkBlueColor,
      ),
      home: MyHomePage(),
      // home: MyHomePage(title: 'Contact List'),
    );
  }
}
//FOR FLUTTER CRUD APP SQLITE ---------------- ENDS ---------------------------
