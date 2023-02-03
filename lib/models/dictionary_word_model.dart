// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DictionaryModel {
  final int? id;
  final String kelime;
  final String ek;
  final String kok;
  final String tur;
  final int? fav;
  DictionaryModel({
    this.id,
    required this.kelime,
    required this.ek,
    required this.kok,
    required this.tur,
    this.fav,
  });

  DictionaryModel copyWith({
    int? id,
    String? kelime,
    String? ek,
    String? kok,
    String? tur,
    int? fav,
  }) {
    return DictionaryModel(
      id: id ?? this.id,
      kelime: kelime ?? this.kelime,
      ek: ek ?? this.ek,
      kok: kok ?? this.kok,
      tur: tur ?? this.tur,
      fav: fav ?? this.fav,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'kelime': kelime,
      'ek': ek,
      'kok': kok,
      'tur': tur,
      'fav': fav,
    };
  }

  factory DictionaryModel.fromMap(Map<String, dynamic> map) {
    return DictionaryModel(
      id: map['id'] as int,
      kelime: map['kelime'] as String,
      ek: map['ek'] as String,
      kok: map['kok'] as String,
      tur: map['tur'] as String,
      fav: map['fav'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DictionaryModel.fromJson(String source) =>
      DictionaryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DictionaryModel(id: $id, kelime: $kelime, ek: $ek, kok: $kok, tur: $tur, fav: $fav)';
  }

  @override
  bool operator ==(covariant DictionaryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.kelime == kelime &&
        other.ek == ek &&
        other.kok == kok &&
        other.tur == tur &&
        other.fav == fav;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        kelime.hashCode ^
        ek.hashCode ^
        kok.hashCode ^
        tur.hashCode ^
        fav.hashCode;
  }
}
