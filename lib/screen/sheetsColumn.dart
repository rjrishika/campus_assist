import 'package:untitled1/screen/attendance/attendance_page.dart';

class SheetsColumn{
  static final branch = 'branch';
  static final semester = 'semester';
  static final subject = 'subject';
  static final date = 'date';
  static final name = 'name';
  static final attendance = 'attendance';
  static final roll_no = 'roll_no';


  static List<String> getCloumns() => [branch,semester,subject,date,name, attendance,roll_no];
}


