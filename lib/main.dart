import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/screen/Club_details.dart';
import 'package:untitled1/screen/Clubs.dart';
import 'package:untitled1/screen/Login.dart';
import 'package:untitled1/screen/attendance/attendance_page.dart';
import 'package:untitled1/screen/attendance/calander_page.dart';
import 'package:untitled1/screen/attendance/Card.dart';
import 'package:untitled1/screen/club_registration.dart';
import 'package:untitled1/screen/googlesheets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyC3BWquWmM8d5hJuZcljBD3mOp16BBGMI8",
      appId: "1:219218681327:android:8c2c1e75679daa6abfea1a",
      messagingSenderId: "219218681327",
      projectId: "campusassistdemo",
      // storageBucket: "campusassistdemo.appspot.com"
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const CalendarPage(),
    );
  }
}
