import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  var challangeRef = FirebaseFirestore.instance
      .collection('challenge')
      .doc('selectionB2-Kok')
      .collection('words');

  var wordsRef = FirebaseFirestore.instance.collection('words');
}
