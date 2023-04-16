import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../reusable_widget/reusable_widget.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  TextEditingController branchTextController = TextEditingController();
  TextEditingController subjectTextController = TextEditingController();

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  String branchValue = 'IT';
  String semesterValue = 'I';

  void _onDaySelected(DateTime day, DateTime focusDay) {
    _focusedDay = day;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: PhysicalModel(
                    color: Colors.white,
                    elevation: 8,
                    shadowColor: Color.fromRGBO(74, 67, 236, 10),
                    borderRadius: BorderRadius.circular(20),
                    child: TableCalendar(
                      calendarFormat: _calendarFormat,
                      onFormatChanged: (format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      },
                      firstDay: DateTime.utc(2023, 1, 23),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: _focusedDay,
                      rowHeight: 40,
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay =
                              focusedDay; // update `_focusedDay` here as well
                        });
                      },
                      headerStyle: HeaderStyle(
                          formatButtonVisible: false, titleCentered: true),
                      availableGestures: AvailableGestures.all,
                      onPageChanged: (focusedDay) {
                        _focusedDay = focusedDay;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: PhysicalModel(
                    color: Colors.white,
                    elevation: 8,
                    shadowColor: Color.fromRGBO(74, 67, 236, 10),
                    borderRadius: BorderRadius.circular(20),
                    child: Column(
                      children: [
                        /// Branch Input
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: reusableTextField(
                              "Enter Branch",
                              Icons.category_outlined,
                              false,
                              branchTextController),
                        ),

                        /// Semester Input
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: DropdownButton<String>(
                              iconEnabledColor: Color.fromRGBO(74, 67, 236, 10),
                              borderRadius: BorderRadius.circular(15),
                              value: semesterValue,
                              hint: Text('Semester'),
                              isExpanded: true,
                              underline: SizedBox(),
                              items: <String>[
                                'I',
                                'II',
                                'III',
                                'IV',
                                'V',
                                'VI',
                                'VII',
                                'VIII',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  semesterValue = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: reusableTextField("Enter Subject",
                              Icons.menu_book, false, subjectTextController),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    color: Color.fromRGBO(74, 67, 236, 10),
                    height: 80.0,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
