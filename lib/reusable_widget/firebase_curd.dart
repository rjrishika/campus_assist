import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


final firestoreInstance = FirebaseFirestore.instance;
final authInstance = FirebaseAuth.instance;


void createCarRecord(String email,String vtype, String vname, String rno,String fac) async {
  await firestoreInstance.collection("clubs").add({
    'email': email,
    'vtype': vtype,
    'vname': vname,
    'rno': rno,
    'fac': fac,
  });
}

Future<Map?> getUserData() async {
  String? userEmail = authInstance.currentUser?.email;

  QuerySnapshot querySnapshot = await firestoreInstance
      .collection('user')
      .where('email', isEqualTo: userEmail)
      .get();

  if (querySnapshot.docs.length > 0) {
    DocumentSnapshot documentSnapshot = querySnapshot.docs[0];
    Map userData = documentSnapshot.data() as Map;

    return userData;
  } else {
    return null;
  }
}


Future<Map?> getCarData() async {


  // QuerySnapshot querySnapshot = await firestoreInstance
  //     .collection('clubs')
  //     .where('name', isEqualTo: userEmail)
  //     .get();

//   if (querySnapshot.docs.length > 0) {
//     DocumentSnapshot documentSnapshot = querySnapshot.docs[0];
//     Map userData = documentSnapshot.data() as Map;
//
//     return userData;
//   } else {
//     return null;
//   }
}
