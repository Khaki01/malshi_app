import 'package:cloud_firestore/cloud_firestore.dart';

class Animal {
  final String uid;
  final String type;
  final String breed;
  final String tag;
  final String sex;
  final String age;
  final String group;
  final String photoUrl;
  final String ancestor;
  final String postId;

  const Animal({
    required this.postId,
    required this.uid,
    required this.type,
    required this.breed,
    required this.tag,
    required this.sex,
    required this.age,
    required this.group,
    required this.photoUrl,
    required this.ancestor,
  });

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "uid": uid,
        "type": type,
        "breed": breed,
        "tag": tag,
        "sex": sex,
        "age": age,
        "group": group,
        "photoUrl": photoUrl,
        "ancestor": ancestor,
      };

  static Animal fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Animal(
      postId: snapshot['postId'],
      uid: snapshot['uid'],
      type: snapshot['type'],
      breed: snapshot['breed'],
      tag: snapshot['tag'],
      sex: snapshot['sex'],
      age: snapshot['age'],
      group: snapshot['group'],
      photoUrl: snapshot['photoUrl'],
      ancestor: snapshot['ancestor'],
    );
  }
}
