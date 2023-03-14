import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:untitled1/screen/Dashboard.dart';
import 'package:untitled1/screen/Sighn_up.dart';
import 'package:untitled1/utils/color_util.dart';
import '../reusable_widget/_ToggleButtonsSampleState.dart';
import '../reusable_widget/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();

}

class _LoginState extends State<Login> {
   final List<bool> _selections = List.generate(3, (_)=>false );

  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();

   @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(

        child: Container(
          padding: const EdgeInsets.fromLTRB(20,0,20,0),
          child: Column(
              children: <Widget>[
              Container(
                child: logoWidget("assets/images/img.png"),
              ),
                Positioned(
                  child:  Container(
                    alignment: Alignment(-1.0, -0.8),
                    margin: EdgeInsets.only(bottom: 30),
                    child: Text("Sign-In", style: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),),
                  ),
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false, emailTextController),
                      SizedBox(
                          height: 20,
                        ),
                        reusableTextField("Enter Password", Icons.lock_clock_outlined, true, passwordTextController),
                      SizedBox(
                          height: 20,
                        ),
                TextButton(
                    onPressed: () {  },
                    child:  Container(
                      alignment: Alignment(0.95, -0.8),
                      child: const Text('Forgot Password?',style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                    )
                ),
               loginSignupButton(context, true,() {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                     email: emailTextController.text,
                     password: passwordTextController.text)
                    .then((value) {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    text: 'login',
                    confirmBtnText: 'Yes',
                    onConfirmBtnTap: ()=>{
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Dashboard())
                    )
                    },
                    confirmBtnColor: Colors.green,
                  );

                }).onError((error, stackTrace){
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Oops...',
                    text: 'Wrong Credential',
                  );
                });
               }),
              Row(
                children: <Widget>[
                  const Text('Does not have account?',style:TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold), ),

                TextButton(
                child: const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  //signup screen
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Sighn_up()));
                },
              )
            ],
                mainAxisAlignment: MainAxisAlignment.center,

              ),


























          // decoration: BoxDecoration(
          //     gradient: LinearGradient(colors: [
          //       hexStringToColor("CB2B93"),
          //       hexStringToColor("9546C4"),
          //       hexStringToColor("5E61F4")
          //     ],begin: Alignment.topCenter,end: Alignment.bottomCenter),
          // ),


          // child: SingleChildScrollView(
          //   child: Padding(
          //     padding: EdgeInsets.fromLTRB(
          //       10,MediaQuery.of(context).size.height * 0.1,10,0),
          //
          //     child: Column(
          //       children: <Widget>[
          //
          //         // ToggleButtons(
          //         //   children: <Widget>[
          //         //
          //         //     Text("SignIn for Students"),
          //         //     Text("SignIn for Teachers"),
          //         //     Text("SignIn"),
          //         //   ],
          //         //   isSelected:_selections,
          //         //   onPressed:(int index){
          //         //     setState(() {
          //         //       _selections[index]=!_selections[index];
          //         //
          //         //       if(index==0 && _selections[index]){
          //         //         Navigator.push(context,
          //         //             MaterialPageRoute(builder: (context)=>Login()));
          //         //       }
          //         //
          //         //
          //         //       else if(index==1 && _selections[index]){
          //         //         Navigator.push(context,
          //         //             MaterialPageRoute(builder: (context)=>Login()));
          //         //       }
          //         //
          //         //
          //         //       else if(index==2 && _selections[index]){
          //         //         Navigator.push(context,
          //         //             MaterialPageRoute(builder: (context)=>LoginNon()));
          //         //       }
          //         //
          //         //
          //         //     });
          //         //   },
          //         //   color:Colors.teal,
          //         //   fillColor:Colors.deepPurple,
          //         // ),
          //
          //
          //         logoWidget("assets/images/logo.png"),
          //         SizedBox(
          //           height: 30,
          //          ),
          //          reusableTextField("Enter UserName", Icons.person_outline, false, emailTextController),
          //         SizedBox(
          //           height: 20,
          //         ),
          //         reusableTextField("Enter Password", Icons.lock_clock_outlined, true, passwordTextController),
          //         SizedBox(
          //           height: 20,
          //         ),
          //         // loginSignupButton(context, true,() async {
          //         //   final FirebaseAuth _auth = FirebaseAuth.instance;
          //         //
          //         //   Future<void> signInWithCustomToken(
          //         //       String customToken) async {
          //         //     try {
          //         //       UserCredential userCredential = await _auth
          //         //           .signInWithCustomToken(customToken);
          //         //       User? user = userCredential.user;
          //         //       print('User ID: ${user?.uid}');
          //         //     } catch (e) {
          //         //       print('Error signing in with custom token: $e');
          //         //     }
          //         //   }
          //         // })
          //
          //       ],



            ]),
            ),
      )
        );

  }

}
