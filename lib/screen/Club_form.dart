import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../reusable_widget/reusable_widget.dart';

class Club_form extends StatefulWidget {
  const Club_form({Key? key}) : super(key: key);

  @override
  State<Club_form> createState() => _Club_formState();
}

class _Club_formState extends State<Club_form> {
  TextEditingController clubNameTextController = TextEditingController();
  TextEditingController clubDescTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
        child: Container(
        padding: const EdgeInsets.fromLTRB(20,10,20,0),
            child: Column(
            children: <Widget>[
              Stack(
    children: [
    Align(
      alignment: Alignment(-1.08, -0.8),
      child: IconButton(
      onPressed: (){},
      icon: Icon(Icons.arrow_back_outlined,size: 40,color:Colors.black,),
      ),
     ),
    ],
    ),
    Positioned(
    child:  Container(
    alignment: Alignment(-1.0, -0.8),
    margin: EdgeInsets.only(bottom: 30),
    child: Text("Sign-Up", style: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),),
    ),
    ),
    reusableTextField("Enter UserName", Icons.person_outline, false, clubNameTextController),
    SizedBox(
    height: 20,
    ),
    reusableTextField("Enter Email", Icons.email_outlined, false, clubDescTextController ),
    SizedBox(
    height: 20,
    ),
    ])
    )
        )
    );
  }
}
