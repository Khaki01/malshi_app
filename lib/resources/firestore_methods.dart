import 'dart:ffi';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:malshi_app/models/animal.dart';
import 'package:malshi_app/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //upload animal
  // upload its image to storage
  // upload its metadata to firebase storage
  Future<String> uploadAnimal(
      Uint8List file,
      String uid,
      String username,
      String type,
      String breed,
      String tag,
      String sex,
      String age,
      String group,
      String ancestor) async {
    String res = "some error occured";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('animals', file, true);

      String uuid = const Uuid().v1();

      Animal animal = Animal(
        postId: uuid,
        uid: uid,
        type: type,
        breed: breed,
        tag: tag,
        sex: sex,
        age: age,
        group: group,
        photoUrl: photoUrl,
        ancestor: ancestor,
      );

      _firestore.collection('animals').doc(uuid).set(animal.toJson());

      res = 'success';
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}
