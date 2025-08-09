import 'package:flutter/material.dart';

class DropdownTesting extends StatefulWidget {
  const DropdownTesting({super.key});

  @override
  State<DropdownTesting> createState() => _DropdownTestingState();
}

class _DropdownTestingState extends State<DropdownTesting> {
  String? dropdownSelect;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dropdown Testing'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Ini halaman Dropdown Testing",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(
                value: dropdownSelect,
                hint: Text("Pilih Produk"),
                items: ["Elektronik", "Pakaian", "Makanan", "Lainnya"].map((
                  String value,
                ) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                onChanged: (value) {
                  setState(() {});
                  dropdownSelect = value;
                },
                isExpanded: true,
                icon: Icon(Icons.arrow_drop_down),
              ),
            ),
            SizedBox(height: 20),
            Text(
              dropdownSelect == null
                  ? "Anda belum memilih produk"
                  : "Produk yang dipilih: $dropdownSelect",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
