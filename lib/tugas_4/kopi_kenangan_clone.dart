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
      appBar: AppBar(
        title: Text('Kopi Kenangan Clone'),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FORMULIR
            Text(
              'Formulir Pengguna:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
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

            // DAFTAR KOPI
            Text(
              'Menu Minuman & Makanan:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            // List Kopi
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: coffeeList.length,
              itemBuilder: (context, index) {
                final coffee = coffeeList[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.brown[100],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.brown.shade200,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          coffee['image'],
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              coffee['name'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              coffee['price'],
                              style: TextStyle(color: Colors.brown[800]),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.add_shopping_cart),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
