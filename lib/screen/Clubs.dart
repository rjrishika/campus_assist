import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Club_details.dart';

class Clubs extends StatefulWidget {
  const Clubs({Key? key}) : super(key: key);

  @override
  State<Clubs> createState() => _ClubsState();
}

class _ClubsState extends State<Clubs> {

  final List<String> items = List<String>.generate(10000, (i) => '$i');
  final firestoreInstance = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
                child: ListView(
                    children: [
                      SizedBox(
                        height: 200.0,
                        width: double.infinity,
                        child: Carousel(
                          dotSize: 6.0,
                          dotSpacing: 15.0,
                          dotPosition: DotPosition.bottomCenter,
                          images: [
                            Image.asset(
                                'assets/images/event.png', fit: BoxFit.cover),
                            Image.asset(
                                'assets/images/event.png', fit: BoxFit.cover),
                            Image.asset(
                                'assets/images/event.png', fit: BoxFit.cover),
                            Image.asset(
                                'assets/images/event.png', fit: BoxFit.cover),
                            Image.asset(
                                'assets/images/event.png', fit: BoxFit.cover),
                            Image.asset(
                                'assets/images/event.png', fit: BoxFit.cover),
                          ],
                        ),
                      ),

                      const Center(
                        child: Text(
                          'Clubs', style: TextStyle(color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),),
                      ),


    SingleChildScrollView(
    child: Column(
    children: [
            StreamBuilder(
                stream:FirebaseFirestore.instance.collection("clubs").snapshots(),
                builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                  if(!snapshot.hasData){
                    return Center(
                      child:CupertinoActivityIndicator()
                    );
                  }
                  return Container(
                      margin: const EdgeInsets.all(10.0),
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            boxShadow: [new BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2.0,
                              offset: Offset(0.0,2.0),
                            ),]
                        ),

                    child: ListView(
                        shrinkWrap: true,
                      children: snapshot.data!.docs.map((snap){
                        return Card(
                          child: ListTile(
                            // leading: Image.network(snap['logo'].toString()),
                            title: Text(snap['name'].toString()),

                            subtitle: Text(snap['desc'].toString()),
                            onTap: (){
                              name:snap['name'];
                              desc:snap['desc'];
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>Club_details(snap: snap,
                                  )));

                            },

                          )
                        );
                      }).toList()
                    )
                  );
                },

            )



































//                       Container(
//                         margin: const EdgeInsets.all(10.0),
//                         decoration: new BoxDecoration(
//                             color: Colors.white,
//                             boxShadow: [new BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 2.0,
//                               offset: Offset(0.0,2.0),
//                             ),]
//                         ),
//                        child: ListTile(
//                           dense:true,
//                           contentPadding: EdgeInsets.only(left: 20.0, right: 4.0,top: 18.0,bottom: 18.0),
//
//                           leading: Image.network(
//                             'https://s3-alpha-sig.figma.com/img/de03/e40b/d5ac00c927bde914907f4c9df773796b?Expires=1679270400&Signature=QlolUxG2hfVfid~fcBvzcmYlmNHha7THepu5AETJ-HjKJ6iRPSD-ibFII1BA3JYZdG1DBtM3SYlgB4w2DEylZsE7oykPQeddu7mNZQWpmhJH5~X-J3V8KRL8fX6g60sXMBI9RsLNrEx~VZ--zcHTyyHqu7-FwpGISLQhF4IGKe7CenMwQWTOSF7usgW8UI6pL~zWVgakwpZdx85ryyAu9LkgTQDg6GmbjTtQK8-ubZysoRJ5TACjacpQ5ICB2CGZWZ-sxpzMRBpFuO9eO~h1Whs1gld3bowgxBxUOyHPeS3qIu1cGqnbeHDjRashQ6bu00GAtVXrYOP1mySRq~r4Gg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
//                           ),
//                           title: Text('Hackreboot',style: TextStyle(fontSize: 26.0),),
//                           subtitle: Text('Technical Club',style:TextStyle(color: Colors.blue),),
//
//                           onTap: (){
//
//                               Navigator.push(context,
//                                   MaterialPageRoute(builder: (context)=>Club_details()));
//
//                           },
//
//
//
//                         ),
//                       ),
//
//                       Container(
//
//                         margin: const EdgeInsets.all(10.0),
//                         decoration: new BoxDecoration(
//                             color: Colors.white,
//                             boxShadow: [new BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 2.0,
//                               offset: Offset(0.0,2.0),
//                             ),]
//                         ),
//                         child: ListTile(
//                           dense:true,
//                           contentPadding: EdgeInsets.only(left: 20.0, right: 4.0,top: 18.0,bottom: 18.0),
//
//                           leading: Image.asset(
//                               'assets/images/gdsc.jpg'
//                           ),
//                           title: Text('GDSC BITD',style: TextStyle(fontSize: 26.0),),
//                           subtitle: Text('Technical Club',style:TextStyle(color: Colors.blue),),
//
//                           onTap: (){
//
//                           },
//
//
//
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.all(10.0),
//                         decoration: new BoxDecoration(
//                             color: Colors.white,
//                             boxShadow: [new BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 2.0,
//                               offset: Offset(0.0,2.0),
//                             ),]
//                         ),
//                         child: ListTile(
//                           dense:true,
//                           contentPadding: EdgeInsets.only(left: 20.0, right: 4.0,top: 18.0,bottom: 18.0),
//
//                           leading: Image.asset(
//                               'assets/images/nssbit.jpg'
//                           ),
//                           title: Text('NSS BITD',style: TextStyle(fontSize: 26.0),),
//                           subtitle: Text('Service Club',style:TextStyle(color: Colors.blue),),
//
//                           onTap: (){
//
//                           },
//
//
//
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.all(10.0),
//                         decoration: new BoxDecoration(
//                             color: Colors.white,
//                             boxShadow: [new BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 2.0,
//                               offset: Offset(0.0,2.0),
//                             ),]
//                         ),
//                         child: ListTile(
//                           dense:true,
//                           contentPadding: EdgeInsets.only(left: 20.0, right: 4.0,top: 18.0,bottom: 18.0),
//
//                           leading: Image.asset(
//                               'assets/images/vista.jpg', fit: BoxFit.cover
//                           ),
//                           title: Text('Vista Club',style: TextStyle(fontSize: 26.0),),
//                           subtitle: Text('Management Club',style:TextStyle(color: Colors.blue),),
//
//                           onTap: (){
//
//                           },
//
//
//
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.all(10.0),
//                         decoration: new BoxDecoration(
//                             color: Colors.white,
//                             boxShadow: [new BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 2.0,
//                               offset: Offset(0.0,2.0),
//                             ),]
//                         ),
//                         child: ListTile(
//                           dense:true,
//                           contentPadding: EdgeInsets.only(left: 20.0, right: 4.0,top: 18.0,bottom: 18.0),
//
//                           leading: Image.asset(
//                               'assets/images/technohub.jpg', fit: BoxFit.cover
//                           ),
//                           title: Text('TechnoHub',style: TextStyle(fontSize: 26.0),),
//                           subtitle: Text('Technical Club',style:TextStyle(color: Colors.blue),),
//
//                           onTap: (){
//
//                           },
//
//
//
//                         ),
//                       ),
//       Container(
//         margin: const EdgeInsets.all(10.0),
//         decoration: new BoxDecoration(
//             color: Colors.white,
//             boxShadow: [new BoxShadow(
//               color: Colors.grey,
//               blurRadius: 2.0,
//               offset: Offset(0.0,2.0),
//             ),]
//         ),
//         child: ListTile(
//           dense:true,
//           contentPadding: EdgeInsets.only(left: 20.0, right: 4.0,top: 18.0,bottom: 18.0),
//
//           leading: Image.asset(
//               'assets/images/tedx.jpg', fit: BoxFit.cover
//           ),
//           title: Text('TedxBITD',style: TextStyle(fontSize: 26.0),),
//           subtitle: Text('Ted Talks',style:TextStyle(color: Colors.blue),),
//
//           onTap: (){
//
//           },
//
//
//
//         ),
//       ),

]
    )

    )

                    ]
                ),



            )
        )
    );
  }

}
