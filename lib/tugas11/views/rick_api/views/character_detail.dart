import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas11/model/character_model.dart';

class CharacterDetail extends StatelessWidget {
  final Character character;

  const CharacterDetail({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name ?? "Detail")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(character.image ?? ""),
            const SizedBox(height: 16),
            Text(
              character.name ?? "No Name",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Status: ${character.status ?? "-"}"),
            Text("Species: ${character.species ?? "-"}"),
            Text("Gender: ${character.gender ?? "-"}"),
          ],
        ),
      ),
    );
  }
}
