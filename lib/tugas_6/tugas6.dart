import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WattpadClone extends StatefulWidget {
  const WattpadClone({super.key});

  @override
  State<WattpadClone> createState() => _WattpadCloneState();
}

class _WattpadCloneState extends State<WattpadClone> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00224F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00224F),
        automaticallyImplyLeading: false, // Nonaktifkan back button default
        title: Stack(
          alignment: Alignment.center,
          children: [
            // Back button di kiri
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            // Judul dan logo di tengah
            Row(
              mainAxisSize: MainAxisSize
                  .min, // Penting agar row tidak mengambil lebar penuh
              children: [
                const Text(
                  'wattpad clone',
                  style: TextStyle(
                    color: Color(0xFFFFDDB0),
                    fontFamily: "Bungee",
                  ),
                ),
                const SizedBox(width: 8),
                Image.asset(
                  'assets/images/logos/logowp-removebg-preview.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ],
        ),
        centerTitle:
            true, // Tetap diperlukan untuk memastikan Stack berada di tengah
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Hello, Welcome Back!",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Welcome back Please\nsign in again",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xFFC4C4C4),
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          border: UnderlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xFFC4C4C4),
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          border: UnderlineInputBorder(),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      width: 287,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Process data.
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto",
                            fontSize: 16,
                            fontWeight: FontWeight.bold, // Warna teks hitam
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 141,
                          height: 0.8,
                          color: Color(0xFF12325E),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "or",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 246, 250, 255),
                            ),
                          ),
                        ),
                        Container(
                          width: 141,
                          height: 0.8,
                          color: Color(0xFF12325E),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Kotak Facebook
                        Container(
                          width: 327,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Color(0xFF11325C),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/logos/Facebook.png',
                                width: 24,
                                height: 24,
                              ), // Logo Facebook
                              SizedBox(width: 8),
                              Text(
                                'Continue with Facebook',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  fontFamily: "Roboto",
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16), // Spasi antar kotak
                        // Kotak Gmail
                        Container(
                          width: 327,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Color(0xFF11325C),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/logos/iconGoogle.png',
                                width: 24,
                                height: 24,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Continue with Gmail',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  fontFamily: "Roboto",
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print("Text Rich Tapped");
                                    },
                                  text: "Already have an account? ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color(0xFF999999),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Sign In",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF3C7EEE),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
