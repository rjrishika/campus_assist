import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../reusable_widget/reusable_widget.dart';

class Card1 extends StatefulWidget {
  const Card1({Key? key}) : super(key: key);

  @override
  State<Card1> createState() => _CardState();
}

class _CardState extends State<Card1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
      toolbarHeight: 60,
      actions: [
        IconButton(
            onPressed: () async{

            },
            icon: const Icon(Icons.notifications_none_rounded))
      ],
      backgroundColor: const Color.fromRGBO(74, 67, 236, 10),
      title: const Text('Club Registration'),
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
    ),
    drawer: appDrawer(),
    body: SingleChildScrollView(
    child: Container(
    padding: const EdgeInsets.fromLTRB(20,0,20,0),
    //padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
    child: Column(
    children: [
    const SizedBox(height: 30, width: 20,),
    Material(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(50),
    child: Container(
    height: 100,
    width: 100,
    child: Image.asset("assets/images/imgUpload.png",
    ),
    ),
    ),
    const SizedBox(height: 10,width: 5,),
    ])

    )


    )
    ),
    );

  }

}
