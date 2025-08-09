import 'package:flutter/material.dart';

class SizeboxTesting extends StatefulWidget {
  const SizeboxTesting({super.key});

  @override
  State<SizeboxTesting> createState() => _SizeboxTestingState();
}

class _SizeboxTestingState extends State<SizeboxTesting> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sizebox Testing'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Saya menyetujui semua persyaratan yang berlaku",
              style: TextStyle(fontSize: 18),
            ),
            Checkbox(
              activeColor: Colors.red,
              value: isCheck,
              onChanged: (value) {
                setState(() {
                  isCheck = value!;
                });
              },
            ),
            Text(
              isCheck == true
                  ? "Lanjutkan pendaftaran diperbolehkan"
                  : "Anda belum bisa melanjutkan",
            ),
          ],
        ),
      ),
    );
  }
}
