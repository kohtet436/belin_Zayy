import 'package:belin_zayy/app/data/model/database_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Stream<DocumentSnapshot<Map<String, dynamic>>>? watchOnly(
          DatabaseModel model) =>
      firebaseFirestore.collection(model.collection).doc(model.doc).snapshots();

  Future<void> write(DatabaseModel model) async {
    try {
      if (!model.isUpdate) {
        await firebaseFirestore
            .collection(model.collection)
            .doc(model.doc!)
            .set(model.data!);
      } else {
        await firebaseFirestore
            .collection(model.collection)
            .doc(model.doc)
            .update(model.data!);
      }
    } catch (e) {
      print("Error is $e");
    }
  }
}
