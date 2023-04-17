import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../reusable_widget/reusable_widget.dart';
import 'Clubs.dart';

class Club_details extends StatelessWidget {
  final DocumentSnapshot snap;

  const Club_details({Key? key, required this.snap}): super(key: key);

  @override
  // State<Club_details> createState() => _Club_detailsState();
// }
//
// class _Club_detailsState extends State<Club_details> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
          body:Column(

            children: [
             SafeArea(child: Stack(
               children: [
                 Image.asset('assets/images/event.png'),
                 IconButton(
                   onPressed: (){
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context)=>Clubs()));
                   },
                   icon: Icon(Icons.arrow_back_outlined,size: 40,color:Colors.black,) ,
                 ),
               ],
             ),),


              Stack(
                children:[Positioned(
                  child:  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(snap['name'].toString(),style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),),

                  ),

                ),
              ]
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Icon(
                      Icons.info_outline_rounded,
                      color: Colors.black,
                      size: 50.0,
                    ),

                    Icon(
                      Icons.groups,
                      color: Colors.black,
                      size: 50.0,
                    ),
                    Icon(
                      Icons.add_circle_outline_rounded,
                      color: Colors.black,
                      size: 50.0,
                    ),
                  ],
                )

              ),
              Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: <Widget>[
                      InkWell(
                        child: Icon(
                          FontAwesomeIcons.instagram,
                          size: 50,
                        ),
                        onTap: () {
                          print(snap['insta'].toString());
                          print('yyyyy');
                           launch(snap['insta'].toString());
                        },
                      ),
                      InkWell(
                        child:Icon(
                          FontAwesomeIcons.linkedin,
                          size: 50,
                        ),
                        onTap: () {
                          // launch(snap['linkedin'].toString());
                        },
                      ),
                      InkWell(
                        child:Icon(
                          FontAwesomeIcons.twitter,
                          size: 50,
                        ),
                        onTap: () {
                          // launch(snap['twitter'].toString());
                        },
                      ),
                    ],
                  )

              ),
              Stack(
                children:[ Positioned(
                  child:  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text("Activities", style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),),

                  ),

                ),
                ]
              ),
        SingleChildScrollView(
        child: Column(
        children: <Widget>[
        Container(
        margin: const EdgeInsets.all(10.0),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [new BoxShadow(
        color: Colors.grey,
        blurRadius: 2.0,
        offset: Offset(0.0,2.0),
        ),]
        ),
        child: ListTile(
        dense:true,
        contentPadding: EdgeInsets.only(left: 20.0, right: 4.0,top: 18.0,bottom: 18.0),
        leading: Image.asset(
        'assets/images/gdsc.jpg',
        ),
        title: Text('Demo Event',style: TextStyle(fontSize: 26.0),),
        subtitle: Text('Technical Club',style:TextStyle(color: Colors.blue),),

        onTap: (){
          color: Colors.grey;
        },



        ),
        ),

        Container(
        margin: const EdgeInsets.all(10.0),
        decoration: new BoxDecoration(
        color: Colors.white,
        boxShadow: [new BoxShadow(
        color: Colors.grey,
        blurRadius: 2.0,
        offset: Offset(0.0,2.0),
        ),]
        ),
        child: ListTile(
        dense:true,
        contentPadding: EdgeInsets.only(left: 20.0, right: 4.0,top: 18.0,bottom: 18.0),
          leading: Image.asset(
            'assets/images/gdsc.jpg',
          ),
        title: Text('Demo Event 2',style: TextStyle(fontSize: 26.0),),
        subtitle: Text('Technical Club',style:TextStyle(color: Colors.blue),),

        onTap: (){

        },



        ),
        ),
        // Container(
        // margin: const EdgeInsets.all(10.0),
        // decoration: new BoxDecoration(
        // color: Colors.white,
        // boxShadow: [new BoxShadow(
        // color: Colors.grey,
        // blurRadius: 2.0,
        // offset: Offset(0.0,2.0),
        // ),]
        // ),
        // child: ListTile(
        // dense:true,
        // contentPadding: EdgeInsets.only(left: 20.0, right: 4.0,top: 18.0,bottom: 18.0),
        //
        //   leading: Image.asset(
        //     'assets/images/gdsc.jpg',
        //   ),
        // title: Text('Hackreboot',style: TextStyle(fontSize: 26.0),),
        // subtitle: Text('Technical Club',style:TextStyle(color: Colors.blue),),
        //
        // onTap: (){
        //
        // },
        //
        //
        //
        // ),
        // ),


            ],



          ),


        )
]
        )

        );

  }
}
