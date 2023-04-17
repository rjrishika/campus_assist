import 'package:flutter/material.dart';
import '../googlesheets.dart';
import '../sheetsColumn.dart';
import 'attendance_brain.dart';

AttendanceBrain attendanceBrain = AttendanceBrain();

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  int attendance = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 60,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_rounded))
        ],
        backgroundColor: const Color.fromRGBO(74, 67, 236, 10),
        title: const Text('Attendance'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PhysicalModel(
              color: Colors.white,
              elevation: 8,
              shadowColor: Color.fromRGBO(74, 67, 236, 10),
              borderRadius: BorderRadius.circular(50),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(attendanceBrain.getImgSrc()),
                  radius: 130,
                ),
              ),
            ),
            SizedBox(
              height: 27,
            ),
            Text(
              attendanceBrain.getName(),
              style: TextStyle(fontSize: 23),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              attendanceBrain.getRoll(),
              style: TextStyle(fontSize: 23),
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () async {


                          final feedback = {
                            SheetsColumn.roll_no:
                            attendanceBrain.getRoll().trim(),
                            SheetsColumn.name:
                            attendanceBrain.getName().toString().trim(),
                            SheetsColumn.attendance: 'A'
                          };

                          await SheetsFlutter.insert([feedback]);
                          setState(() {
                            attendanceBrain.nextRoll();
                          });
                        },
                        child: Icon(Icons.close),
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.red)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () async {


                          final feedback = {
                            SheetsColumn.roll_no:
                                attendanceBrain.getRoll().trim(),
                            SheetsColumn.name:
                                attendanceBrain.getName().toString().trim(),
                            SheetsColumn.attendance: 'P'
                          };

                          await SheetsFlutter.insert([feedback]);
                          setState(() {
                            attendanceBrain.nextRoll();
                          });
                        },
                        child: Icon(Icons.check),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
