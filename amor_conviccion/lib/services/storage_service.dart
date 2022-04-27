import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as fire_base_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class Storage{
  final fire_base_storage.FirebaseStorage storage =
      fire_base_storage.FirebaseStorage.instance;

  Future<void> uploadFile(String path, String name) async{
    File file = File(path);
    try{
      await storage.ref('$name').putFile(file);
    } on firebase_core.FirebaseException catch (e){
      print (e);
    }
  }
}