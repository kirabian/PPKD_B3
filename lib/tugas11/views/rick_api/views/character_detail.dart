import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ppkdb3/tugas11/model/character_model.dart';

/// Fungsi fetch data episode dari API
Future<Episode> fetchEpisode(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return Episode.fromJson(json.decode(response.body));
  } else {
    throw Exception("Failed to load episode");
  }
}

class CharacterDetail extends StatelessWidget {
  final Result character;

  const CharacterDetail({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 285,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 187, 187, 187),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: character.image != null
                            ? NetworkImage(character.image!)
                            : null,
                        child: character.image == null
                            ? const Icon(Icons.person, size: 80)
                            : null,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        character.name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildInfoRow("Species:", character.species ?? "-"),
            _buildInfoRow("Gender:", character.gender ?? "-"),
            _buildInfoRow("Origin:", character.origin.name ?? "Unknown"),
            _buildInfoRow("Location:", character.location.name ?? "Unknown"),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Episodes:",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            /// List episode
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: character.episode.length,
              itemBuilder: (context, index) {
                return FutureBuilder<Episode>(
                  future: fetchEpisode(character.episode[index]),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ListTile(
                        leading: CircleAvatar(child: Text("${index + 1}")),
                        title: const Text("Loading..."),
                      );
                    } else if (snapshot.hasError) {
                      return ListTile(
                        leading: CircleAvatar(child: Text("${index + 1}")),
                        title: const Text("Error loading episode"),
                      );
                    } else {
                      final episode = snapshot.data!;
                      return ListTile(
                        leading: CircleAvatar(child: Text("${index + 1}")),
                        title: Text(episode.name ?? "Unknown"),
                        subtitle: Text(
                          episode.episodeCode ?? "-",
                        ), // contoh: S01E01
                      );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Flexible(
            child: Text(
              value.isNotEmpty ? value : "-",
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
