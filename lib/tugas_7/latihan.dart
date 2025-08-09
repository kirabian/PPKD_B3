import 'package:flutter/material.dart';

class FormElementDemo extends StatefulWidget {
  const FormElementDemo({super.key});

  @override
  State<FormElementDemo> createState() => _FormElementDemoState();
}

class _FormElementDemoState extends State<FormElementDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN TEST'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/backgrounds/download.jpg',
            ), // letakkan file gambar di folder assets
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // FlutterLogo(size: 40),
              SizedBox(height: 20),
              Text(
                'APLIKASIKU',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Bungee",
                ),
              ),
              SizedBox(height: 200),
              Image.asset(
                'assets/images/backgrounds/oniface.png',
                width: 250,
              ), // ilustrasi oni
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFB23A3A),
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  elevation: 4,
                ),
                onPressed: () {},
                child: Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
