import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etimology/core/services/firebase_service.dart';

import '../../../models/dictionary_word_model.dart';

class SearchViewModel {
  StreamController controller = StreamController.broadcast();
  String name = "";
  Stream<QuerySnapshot<Map<String, dynamic>>> firebaseStream =
      FirebaseHelper().wordsRef.snapshots();

  void filter(val, funcs) {
    controller.sink.add(val);
    funcs;
  }

  convertData(model) {
    DictionaryModel data = DictionaryModel(
      kelime: model['kelime'],
      ek: model['ek'],
      kok: model['kok'],
      tur: model['tur'],
    );
    return data;
  }
}
