import 'package:flutter/material.dart';

class KopiKenanganClone extends StatelessWidget {
  const KopiKenanganClone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kopi Kenangan Clone')),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Stack(
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
                      ListTile(
                        leading: Image.asset(
                          'assets/images/coffees/kopi_satu.jpg',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        title: Text('Magic Spanish Latte'),
                        subtitle: Text('Rp 30.000'),
                        trailing: Icon(Icons.add_shopping_cart),
                      ),
                      ListTile(
                        leading: Image.asset(
                          'assets/images/coffees/kopi_dua.jpg',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        title: Text('OATSIDE Magic Matcha Latte'),
                        subtitle: Text('Rp 25.000'),
                        trailing: Icon(Icons.add_shopping_cart),
                      ),
                      ListTile(
                        leading: Image.asset(
                          'assets/images/coffees/kopi_tiga.jpg',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        title: Text('OAATSIDE Magic Aren Latte'),
                        subtitle: Text('Rp 35.000'),
                        trailing: Icon(Icons.add_shopping_cart),
                      ),
                      ListTile(
                        leading: Image.asset(
                          'assets/images/coffees/roti_satu.jpg',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        title: Text('O`Boy Coffee Toast'),
                        subtitle: Text('Rp 45.000'),
                        trailing: Icon(Icons.add_shopping_cart),
                      ),
                      ListTile(
                        leading: Image.asset(
                          'assets/images/coffees/kue_satu.jpg',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        title: Text('Berry Love Cromboloni'),
                        subtitle: Text('Rp 20.000'),
                        trailing: Icon(Icons.add_shopping_cart),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
