//import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'attendance.dart';



List<Attendance> attendanceList = [];
class AttendanceBrain {

  // Future<void> getSortedData() async{
  //   await FirebaseFirestore.instance
  //       .collection('IT_4th')
  //       .orderBy('CRN', descending: false)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) => {
  //     querySnapshot.docs.forEach((doc) {
  //       dynamic nm = doc['Name'];
  //       dynamic roll = doc['URN'];
  //       attendanceList.add(Attendance(nm, roll, "img"));
  //       //print(nm);
  //     })
  //   });
  // }
  // AttendanceBrain(){
  //   getSortedData();
  //   print(attendanceList);
  // }
  int rollNo = 0;

  //List<Attendance> attendanceList = getSortedData() as List<Attendance>;

  void nextRoll() {
    rollNo++;
  }

  String getName() {
    return attendanceList[rollNo].name;
  }

  String getRoll() {
    return attendanceList[rollNo].roll;
  }

  String getImgSrc() {
    return attendanceList[rollNo].imgSrc;
  }
}
