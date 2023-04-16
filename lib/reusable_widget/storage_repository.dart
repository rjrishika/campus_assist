
import 'dart:io';

import 'package:cross_file/src/types/interface.dart';
import 'package:untitled1/reusable_widget/firebase_storage_service.dart';

import 'base_storage_repository.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class StorageRepository extends BaseStorageRepository{
  final firebase_storage.FirebaseStorage storage =
       firebase_storage.FirebaseStorage.instance;
  @override
  Future<String> getDownloadURL(String imageName) async {
    // TODO: implement getDownloadURL
    String downloadURL = await storage.ref('clubs_img/$imageName').getDownloadURL();
     return downloadURL;
  }

  @override
  Future<void> uploadImage(image) async {
    // TODO: implement uploadImage
   try{
     await storage.ref('clubs_img/${image.name}').putFile(
       File(image.path),
     ).then((p0) => DatabaseRepository().updateUserPictures(image.name));
   }catch(error){
     print(error);
   }
  }

}