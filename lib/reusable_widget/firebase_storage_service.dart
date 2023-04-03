import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:storage_repository/implementations/storage_repository.dart';
import 'package:untitled1/reusable_widget/club_model.dart';
import 'package:untitled1/reusable_widget/storage_repository.dart';

import 'base_database_repo.dart';

class DatabaseRepository extends BaseDatabaseRepository{
  final FirebaseFirestore _firebaseFirestore= FirebaseFirestore.instance;
  @override
  Stream<Club> getClub() {
    // TODO: implement getClub
    return _firebaseFirestore
        .collection('clubs')
        .doc('D2Vyz4Q3sJJPFWw9AE22')
        .snapshots()
        .map((snap)=>Club.fromSnapshot(snap));
  }

  @override
  Future<void> updateUserPictures(String imageName) async {
    // TODO: implement updateUserPictures
     String downloadUrl = await StorageRepository().getDownloadURL(imageName);

     return _firebaseFirestore.collection('clubs').doc('D2Vyz4Q3sJJPFWw9AE22').update({'logo':downloadUrl});
  }

}



