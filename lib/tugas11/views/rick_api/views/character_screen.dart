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
  int _currentPage = 1;
  late Future<Welcome> _futureCharacters;

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _futureCharacters = getCharacter(page: _currentPage);
  }

  void _loadPage(int page) {
    setState(() {
      _currentPage = page;
      _futureCharacters = getCharacter(page: _currentPage);
    });
  }

  void _search(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _isSearching = false;
        _futureCharacters = getCharacter(page: _currentPage);
      } else {
        _isSearching = true;
        _futureCharacters = searchCharacter(query.trim().toLowerCase());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rick and Morty API")),
      body: Column(
        children: [
          // 🔍 Search Box
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _search,
              decoration: InputDecoration(
                labelText: "Search character",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _search("");
                  },
                ),
              ),
            ),
          ),

          // 📋 Grid Data
          Expanded(
            child: FutureBuilder<Welcome>(
              future: _futureCharacters,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (snapshot.hasData) {
                  final welcome = snapshot.data as Welcome;
                  final users = welcome.results;

                  if (users.isEmpty) {
                    return const Center(child: Text("Data tidak ditemukan"));
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 kolom kayak katalog anime
                          childAspectRatio:
                              0.7, // tinggi > lebar biar proporsional
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) {
                      final dataChar = users[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CharacterDetail(character: dataChar),
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                  child: dataChar.image != null
                                      ? Image.network(
                                          dataChar.image!,
                                          fit: BoxFit.cover,
                                        )
                                      : Container(
                                          color: Colors.grey[300],
                                          child: const Icon(
                                            Icons.person,
                                            size: 50,
                                          ),
                                        ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dataChar.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      dataChar.origin.name ?? "Unknown",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      dataChar.status.isNotEmpty
                                          ? dataChar.status
                                          : "-",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: dataChar.status == "Alive"
                                            ? Colors.green
                                            : (dataChar.status == "Dead"
                                                  ? Colors.red
                                                  : Colors.grey),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("Gagal memuat data"));
                }
              },
            ),
          ),

          // ⏮️ Pagination (hanya muncul kalau tidak searching)
          if (!_isSearching)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: FutureBuilder<Welcome>(
                future: _futureCharacters,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const SizedBox.shrink();

                  final info = snapshot.data!.info;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: info.prev != null
                            ? () => _loadPage(_currentPage - 1)
                            : null,
                        child: const Text("Prev"),
                      ),
                      const SizedBox(width: 16),
                      Text("Page $_currentPage"),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: info.next != null
                            ? () => _loadPage(_currentPage + 1)
                            : null,
                        child: const Text("Next"),
                      ),
                    ],
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
