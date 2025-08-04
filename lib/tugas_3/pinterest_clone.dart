import 'package:flutter/material.dart';

class PinterestClone extends StatelessWidget {
  const PinterestClone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pinterest Clone')),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Formulir Pengguna:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nama',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'No. HP',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 12),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Deskripsi',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.description),
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Galeri Gambar:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Container(
                            height: 250,
                            width: 250,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 86, 244, 54),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Center(
                              child: Text(
                                'Warna Satu',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 250,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Center(
                              child: Text(
                                'Warna Dua',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 250,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Center(
                              child: Text(
                                'Warna Tiga',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 250,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Center(
                              child: Text(
                                'Warna Empat',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 250,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Center(
                              child: Text(
                                'Warna Lima',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 250,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.tealAccent,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Center(
                              child: Text(
                                'Warna Enam',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
