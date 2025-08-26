import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas11/model/character_model.dart';
import 'package:ppkdb3/tugas11/views/rick_api/get_api.dart';
import 'package:ppkdb3/tugas11/views/rick_api/views/character_detail.dart';
// import 'package:ppkd_b_3/day_23/api/get_user.dart';
// import 'package:ppkd_b_3/day_23/model/user_model.dart';

class RickApi extends StatefulWidget {
  const RickApi({super.key});
  static const routeName = "/get_api_screen";

  @override
  State<RickApi> createState() => _RickApiState();
}

class _RickApiState extends State<RickApi> {
  late Character character;
  @override
  // void initState() {
  //   super.initState();
  //   getUser();
  // }
  @override
  void handleTapOnCard() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CharacterDetail(character: character),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<List<Character>>(
                future: getCharacter(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    final users = snapshot.data as List<Character>;
                    return GestureDetector(
                      onTap: handleTapOnCard,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: users.length,
                        itemBuilder: (BuildContext context, int index) {
                          final dataChar = users[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Image.network(dataChar.image ?? ""),
                              title: Text(dataChar.name ?? ""),
                              // subtitle: Text(
                              //   "${dataChar.firstName} ${dataChar.lastName}" ?? "",
                              // ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Text("Gagal Memuat data");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
