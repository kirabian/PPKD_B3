import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas9/model/bukumodel.dart';
import 'package:ppkdb3/tugas_6/app_bottom_nav.dart';
import 'package:ppkdb3/tugas_6/app_drawer.dart';

class ModelBuku extends StatefulWidget {
  static const String routeName = '/modelbuku';
  const ModelBuku({super.key});

  @override
  State<ModelBuku> createState() => _ModelBukuState();
}

class _ModelBukuState extends State<ModelBuku> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // List buku menggunakan model
  final List<BukuModel> takdirKami = [
    BukuModel(judul: "Bumi", gambar: "assets/images/novel/Bumi.jpg"),
    BukuModel(judul: "Bulan", gambar: "assets/images/novel/bulan.jpg"),
    BukuModel(judul: "Matahari", gambar: "assets/images/novel/matahari.jpg"),
    BukuModel(judul: "Bintang", gambar: "assets/images/novel/Bintang.jpg"),
    BukuModel(
      judul: "Batozar",
      gambar: "assets/images/novel/CerosDanBatozar.jpg",
    ),
    BukuModel(judul: "Komet", gambar: "assets/images/novel/Komet.jpg"),
    BukuModel(
      judul: "Komet Minor",
      gambar: "assets/images/novel/KometMinor.jpg",
    ),
    BukuModel(judul: "Selena", gambar: "assets/images/novel/selena.jpg"),
    BukuModel(judul: "Nebula", gambar: "assets/images/novel/nebula.jpg"),
    BukuModel(judul: "Si Putih", gambar: "assets/images/novel/siputih.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Buku Serial Bumi')),
      drawer: const AppDrawer(userData: {}),
      body: ListView.builder(
        itemCount: takdirKami.length,
        itemBuilder: (context, index) {
          final buku = takdirKami[index];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                buku.gambar,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 50),
              ),
            ),
            title: Text(
              buku.judul,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text("Buku dari serial \"Bumi\""),
            trailing: CircleAvatar(
              backgroundColor: Colors.blueGrey.shade100,
              child: Text("${index + 1}"),
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Anda mengetuk buku ${buku.judul}')),
              );
            },
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
