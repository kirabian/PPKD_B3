import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ppkdb3/tugas11/model/character_model.dart';

Future<List<Character>> getCharacter() async {
  final response = await http.get(
    Uri.parse("https://rickandmortyapi.com/api/character"),
  );
  if (response.statusCode == 200) {
    final List<dynamic> userJson = json.decode(response.body)["results"];
    return userJson.map((json) => Character.fromJson(json)).toList();
  } else {
    throw Exception("Gagal memuat data");
  }
}
