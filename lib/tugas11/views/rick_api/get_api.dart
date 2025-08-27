import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ppkdb3/tugas11/model/character_model.dart';

Future<Welcome> getCharacter({int page = 1}) async {
  final response = await http.get(
    Uri.parse("https://rickandmortyapi.com/api/character?page=$page"),
  );
  if (response.statusCode == 200) {
    return Welcome.fromJson(json.decode(response.body));
  } else {
    throw Exception("Gagal memuat data");
  }
}

Future<Welcome> searchCharacter(String query) async {
  final encodedQuery = Uri.encodeQueryComponent(query.toLowerCase());
  final response = await http.get(
    Uri.parse("https://rickandmortyapi.com/api/character/?name=$encodedQuery"),
  );

  if (response.statusCode == 200) {
    return Welcome.fromJson(json.decode(response.body));
  } else {
    throw Exception("Data tidak ditemukan");
  }
}
