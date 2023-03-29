import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../reusable_widget/reusable_widget.dart';

class ClubRegistration extends StatefulWidget {
  const ClubRegistration({Key? key}) : super(key: key);

  @override
  State<ClubRegistration> createState() => _ClubRegistrationState();
}

class _ClubRegistrationState extends State<ClubRegistration> {
  TextEditingController clubName = TextEditingController();
  TextEditingController clubCategory = TextEditingController();
  TextEditingController clubDesc = TextEditingController();
  TextEditingController instaUrl = TextEditingController();
  TextEditingController twitterUrl = TextEditingController();
  TextEditingController linkedinUrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          actions: [
            IconButton(
                onPressed: () {},
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
        drawer: const Drawer(
          child: Text('Hello World'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20,0,20,0),
              //padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 50,width: 50,),
                  reusableTextField("Enter Club Name", Icons.abc, false, clubName),
                  const SizedBox(height: 20,width: 20,),
                  reusableTextField("Club Category", Icons.account_tree_outlined, false, clubCategory),
                  const SizedBox(height: 20,width: 20,),

                  resusableMultilineTextField("Club Description...", false, 3, clubDesc, const Icon(FontAwesomeIcons.addressBook)),

                  const SizedBox(height: 20,width: 20,),

                  resusableMultilineTextField("Instagram URL", false, 1, instaUrl,const Icon(FontAwesomeIcons.instagram) ),

                  const SizedBox(height: 20,width: 20,),

                  resusableMultilineTextField("Twitter URL", false, 1, twitterUrl,const Icon(FontAwesomeIcons.twitter) ),

                  const SizedBox(height: 20,width: 20,),

                  resusableMultilineTextField("LinkedIn URL", false, 1, linkedinUrl,const Icon(FontAwesomeIcons.linkedin) ),

                  const SizedBox(height: 20, width: 20,),

        Container(
          padding: const EdgeInsets.fromLTRB(30,5,30,0),
          width: MediaQuery.of(context).size.width,
          height: 60,
          margin: const EdgeInsets.fromLTRB(0,10,0,20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
          child: ElevatedButton(
            onPressed: (){

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
            ),
          ),
        ),
      ),
    );
  }
}
