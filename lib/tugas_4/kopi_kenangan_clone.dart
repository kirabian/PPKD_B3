import 'package:flutter/material.dart';

class KopiKenanganClone extends StatelessWidget {
  const KopiKenanganClone({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> coffeeList = [
      {
        'name': 'Magic Spanish Latte',
        'price': 'Rp 30.000',
        'image': 'assets/images/coffees/kopi_satu.jpg',
      },
      {
        'name': 'OATSIDE Magic Matcha Latte',
        'price': 'Rp 25.000',
        'image': 'assets/images/coffees/kopi_dua.jpg',
      },
      {
        'name': 'OAATSIDE Magic Aren Latte',
        'price': 'Rp 35.000',
        'image': 'assets/images/coffees/kopi_tiga.jpg',
      },
      {
        'name': 'O`Boy Coffee Toast',
        'price': 'Rp 45.000',
        'image': 'assets/images/coffees/roti_satu.jpg',
      },
      {
        'name': 'Berry Love Cromboloni',
        'price': 'Rp 20.000',
        'image': 'assets/images/coffees/kue_satu.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Kopi Kenangan Clone')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'Formulir Pengguna:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
          SizedBox(height: 24),
          Text(
            'Daftar Produk:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          ...coffeeList.map((coffee) {
            return ListTile(
              leading: Image.asset(
                coffee['image'],
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
              title: Text(coffee['name']),
              subtitle: Text(coffee['price']),
              trailing: Icon(Icons.add_shopping_cart),
            );
          }).toList(),
        ],
      ),
    );
  }
}
