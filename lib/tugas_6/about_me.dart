import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About Me")),
      body: const Center(
        child: Text("Ini halaman About Me", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
