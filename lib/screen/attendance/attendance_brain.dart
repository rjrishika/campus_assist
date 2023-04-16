import 'package:flutter/cupertino.dart';

import 'attendance.dart';

class AttendanceBrain {
  int rollNo = 0;

  List<Attendance> attendanceList = [
    Attendance('Person 1', '1', 'https://i.pravatar.cc/150?img=15'),
    Attendance('Person 2', '2', 'https://i.pravatar.cc/150?img=25'),
    Attendance('Person 3', '3', 'https://i.pravatar.cc/150?img=32'),
    Attendance('Person 4', '4', 'https://i.pravatar.cc/150?img=29'),
  ];

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
