import 'package:GVPS/models/brew.dart';
import 'package:GVPS/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //collection reference
  final CollectionReference collectionReference =
      Firestore.instance.collection('GVPS');
  final String uid;

  DatabaseService({this.uid});

  Future updateUserData(String sugars, String name, int strength) async {
    return await collectionReference.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  Future getData() async {
    return collectionReference
        .document('2018')
        .collection('students')
        .snapshots()
        .toList();
  }

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        name: doc.data['name'] ?? '',
      );
    }).toList();
  }

//userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot documentSnapshot) {
    return UserData(
      name: documentSnapshot.data['name'],
    );
  }

  // get brews stream
  Stream<List<Brew>> get brews {
    return collectionReference
        .document('2018')
        .collection('students')
        .snapshots()
        .map(_brewListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return collectionReference
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
