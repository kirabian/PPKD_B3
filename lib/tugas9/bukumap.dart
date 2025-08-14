import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas_6/app_bottom_nav.dart';
import 'package:ppkdb3/tugas_6/app_drawer.dart';

class BukuMap extends StatefulWidget {
  static const String routeName = '/bukumap';
  const BukuMap({super.key});

  @override
  State<BukuMap> createState() => _BukuMapState();
}

class _BukuMapState extends State<BukuMap> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // List judul dan gambar
  final List<Map<String, String>> takdirKami = [
    {"judul": "Bumi", "gambar": "assets/images/novel/Bumi.jpg"},
    {"judul": "Bulan", "gambar": "assets/images/novel/bulan.jpg"},
    {"judul": "Matahari", "gambar": "assets/images/novel/matahari.jpg"},
    {"judul": "Bintang", "gambar": "assets/images/novel/Bintang.jpg"},
    {"judul": "Batozar", "gambar": "assets/images/novel/CerosDanBatozar.jpg"},
    {"judul": "Komet", "gambar": "assets/images/novel/Komet.jpg"},
    {"judul": "Komet Minor", "gambar": "assets/images/novel/KometMinor.jpg"},
    {"judul": "Selena", "gambar": "assets/images/novel/selena.jpg"},
    {"judul": "Nebula", "gambar": "assets/images/novel/nebula.jpg"},
    {"judul": "Si Putih", "gambar": "assets/images/novel/siputih.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Buku Serial Bumi')),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: takdirKami.length,
        itemBuilder: (BuildContext context, int index) {
          final item = takdirKami[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  item["gambar"]!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, size: 50);
                  },
                ),
              ),
              title: Text(
                item["judul"]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Buku dari serial \"Bumi\""),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
              onTap: () {
                // Aksi jika item di-tap
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Anda mengetuk buku ${item["judul"]!}'),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
