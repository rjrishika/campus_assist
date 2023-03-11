import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/screen/Login.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Logout"),
          onPressed: (){
            FirebaseAuth.instance.signOut().then((value){
              print("SignedOut");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> Login()));
            });

          },
        ),
      )
    );
  }
}
