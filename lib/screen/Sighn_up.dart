import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled1/screen/Dashboard.dart';
import '../reusable_widget/reusable_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Login.dart';

class Sighn_up extends StatefulWidget {
  const Sighn_up({Key? key}) : super(key: key);


  @override
  State<Sighn_up> createState() => _Sighn_upState();
}

class _Sighn_upState extends State<Sighn_up> {
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController userNameTextController = TextEditingController();
  // String allowedDomains = "bitdurg.ac.in"; // replace with your allowed domains
  // RegExp emailRegex = new RegExp(r'^\w+([\.-]?\w+)*@('+"bitdurg.ac.in"+')$');
  late String password;
  FirebaseFirestore firestore = FirebaseFirestore.instance;



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
                 icon: Icon(Icons.arrow_back_outlined,size: 40,color:Colors.black,) ,
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
                reusableTextField("Enter UserName", Icons.person_outline, false, userNameTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email", Icons.email_outlined, false, emailTextController),
                SizedBox(
                  height: 20,
                ),
              reusableTextField("Enter Password", Icons.lock_clock_outlined, true, passwordTextController),
              SizedBox(
                height: 20,
              ),
              reusableTextField("Confirm Password", Icons.lock_clock_outlined, true, passwordTextController),
              SizedBox(
                height: 20,
              ),
              loginSignupButton(context, false,()  async{


                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(email: emailTextController.text,
                    password: passwordTextController.text)

                .then((value){
                  FirebaseFirestore.instance.collection('users').add({'name': userNameTextController.text,'email':emailTextController});
                  Navigator.push(context,
                     MaterialPageRoute(builder: (context)=>Dashboard()));
                }).onError((error,stackTrace){
                  print("Error ${error.toString()}");
                });

              }),
              Row(
                children: <Widget>[
                  const Text('Already have an account?',style:TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold), ),
                  TextButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      //signup screen
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>Login()));
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),

    ]
    )
    )
    ),
    );
  }
}

