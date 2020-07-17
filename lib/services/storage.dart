import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  final StorageReference storageReference = FirebaseStorage.instance.ref();
}
