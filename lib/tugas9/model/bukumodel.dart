// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BukuModel {
  final String judul;
  final String gambar;

  BukuModel({required this.judul, required this.gambar});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'judul': judul, 'gambar': gambar};
  }

  factory BukuModel.fromMap(Map<String, dynamic> map) {
    return BukuModel(
      judul: map['judul'] as String,
      gambar: map['gambar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BukuModel.fromJson(String source) =>
      BukuModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
