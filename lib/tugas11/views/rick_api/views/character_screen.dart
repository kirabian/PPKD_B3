import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas11/model/character_model.dart';
import 'package:ppkdb3/tugas11/views/rick_api/get_api.dart';
import 'package:ppkdb3/tugas11/views/rick_api/views/character_detail.dart';

class RickApi extends StatefulWidget {
  const RickApi({super.key});
  static const routeName = "/get_api_screen";

  @override
  State<RickApi> createState() => _RickApiState();
}

class _RickApiState extends State<RickApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Character>>(
        future: getCharacter(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final users = snapshot.data as List<Character>;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                final dataChar = users[index];
                return ListTile(
                  leading: Image.network(dataChar.image ?? ""),
                  title: Text(dataChar.name ?? ""),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CharacterDetail(character: dataChar),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(child: Text("Gagal Memuat data"));
          }
        },
      ),
    );
  }
}
