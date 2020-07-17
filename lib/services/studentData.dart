import 'package:GVPS/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentData {
  final CollectionReference collectionReference =
      Firestore.instance.collection('GVPS');
  final int classno;
  final String did;
  StudentData({this.classno, this.did});

  Stream<ClassData> get studentsdata {
    return collectionReference.document(did).snapshots().map(_studentsdata);
  }

  ClassData _studentsdata(DocumentSnapshot doc) {
    return ClassData(
      aadhar: doc.data['aadhar'] ?? 0,
      accountno: doc.data['accountno'] ?? '',
      caste: doc.data['caste'] ?? '',
      classno: doc.data['classno'] ?? 0,
      did: doc.documentID ?? 'null',
      dob: doc.data['dob'] ?? '',
      father: doc.data['father'] ?? '',
      fmid: doc.data['fmid'] ?? '',
      ifsc: doc.data['ifsc'] ?? '',
      mother: doc.data['mother'] ?? '',
      name: doc.data['name'] ?? '',
      ssmid: doc.data['ssmid'] ?? '',
      paidfees: doc.data['paidfees'] ?? '0',
      remainingfees: doc.data['remainingfees'] ?? '0',
      totalfees: doc.data['totalfees'] ?? '0',
    );
  }

  Future<int> getTotalCLass(int standard) => collectionReference
          .where('classno', isEqualTo: standard)
          .getDocuments()
          .then((snapshot) {
        return snapshot.documents.length;
      });

  Stream<List<ClassData>> get classesdata {
    if (classno != 0) {
      return collectionReference
          .where('classno', isEqualTo: classno)
          .snapshots()
          .map(_classData);
    } else {
      return collectionReference.snapshots().map(_classData);
    }
  }

  List<ClassData> _classData(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return ClassData(
        aadhar: doc.data['aadhar'] ?? 0,
        accountno: doc.data['accountno'] ?? '',
        caste: doc.data['caste'] ?? '',
        classno: doc.data['classno'] ?? 0,
        did: doc.documentID ?? 'null',
        dob: doc.data['dob'] ?? '',
        father: doc.data['father'] ?? '',
        fmid: doc.data['fmid'] ?? '',
        ifsc: doc.data['ifsc'] ?? '',
        mother: doc.data['mother'] ?? '',
        name: doc.data['name'] ?? '',
        ssmid: doc.data['ssmid'] ?? '',
        paidfees: doc.data['paidfees'] ?? '0',
        remainingfees: doc.data['remainingfees'] ?? '0',
        totalfees: doc.data['totalfees'] ?? '0',
      );
    }).toList();
  }

  Future updateStudentFees(String did, String totalfees, String paidfees,
      String remainingfees) async {
    return await collectionReference.document(did).updateData({
      'totalfees': totalfees,
      'paidfees': paidfees,
      'remainingfees': remainingfees,
    });
  }
}
