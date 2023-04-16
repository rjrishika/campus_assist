import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../reusable_widget/reusable_widget.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
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
  CollectionReference clubData = FirebaseFirestore.instance.collection('clubs');
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
                  InkWell(
                    onTap: (){

                      // code to upload Image

                    },
                    child: const Text("Upload Image", style: TextStyle(
                      color: Colors.blue,
                    ),
                    )),
                  const SizedBox(height: 20,width: 20,),
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

                  //const SizedBox(height: 20, width: 20,),

        Container(
          padding: const EdgeInsets.fromLTRB(30,5,30,0),
          width: MediaQuery.of(context).size.width,
          height: 60,
          margin: const EdgeInsets.fromLTRB(0,10,0,20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
          child: ElevatedButton(
            onPressed: () async{
                await clubData.add({'name': '${clubName.text}',
                'category': '${clubCategory.text}',
                'desc': '${clubDesc.text}',
                'insta': '${instaUrl.text}',
                  'twitter': '${twitterUrl.text}',
                'linkedin': '${linkedinUrl.text}',});

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
            ),
          ),
        ),
      ),
    );
  }
}
