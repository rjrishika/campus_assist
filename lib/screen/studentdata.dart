import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../reusable_widget/reusable_widget.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class StudentData extends StatefulWidget {
  const StudentData({Key? key}) : super(key: key);

  @override
  State<StudentData> createState() => _StudentDataState();
}

class _StudentDataState extends State<StudentData> {

  TextEditingController crn = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController photo = TextEditingController();
  TextEditingController urn = TextEditingController();
  CollectionReference clubData = FirebaseFirestore.instance.collection('IT_4th');
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [const SizedBox(height: 50,width: 20,),
              reusableTextField("CRN", Icons.abc, false, crn),
              const SizedBox(height: 20,width: 20,),
              reusableTextField("Name", Icons.account_tree_outlined, false, name),
              const SizedBox(height: 20,width: 20,),

              const SizedBox(height: 20,width: 20,
              ),
              reusableTextField("Photo", Icons.abc, false, photo),
              const SizedBox(height: 20,width: 20,),
              reusableTextField("URN", Icons.account_tree_outlined, false, urn),
              const SizedBox(height: 20,width: 20,),

              Container(
                  padding: const EdgeInsets.fromLTRB(30,5,30,0),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  margin: const EdgeInsets.fromLTRB(0,10,0,20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
                  child: ElevatedButton(
                    onPressed: () async{
                      await clubData.add({'CRN': '${crn.text}',
                        'Name': '${name.text}',
                        'Photo': '${photo.text}',
                        'URN': '${urn.text}',});

                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        title: 'Club Added',
                        text: 'Details saved successfully',
                        confirmBtnText: 'Ok',
                        onConfirmBtnTap: ()=>{
                          Navigator.of(context).pop(),
                        },
                        confirmBtnColor: Colors.green,
                      );
                      setState(() {

                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if(states.contains(MaterialState.pressed)){
                            return Colors.blueAccent;
                          }
                          return Colors.blue;
                        }),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                        )
                    ),
                    child: const Text("Request Verification",
                      style:  TextStyle(
                          color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 16),
                    ),
                  )
              ),

            ],
          )

      ),
      ),
    );
  }
}
