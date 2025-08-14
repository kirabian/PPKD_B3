import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas10/textform.dart';
import 'package:ppkdb3/tugas11/model/user.dart';
import 'package:ppkdb3/tugas11/sqflite/db_helper.dart';

class UserFormScreen extends StatefulWidget {
  static const String routeName = '/user_form_screen';
  const UserFormScreen({super.key});

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> saveUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final name = nameController.text.trim();

    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email, Password, dan Nama tidak boleh kosong"),
        ),
      );
      return;
    }

    final user = User(email: email, password: password, name: name);
    await DbHelper.registerUser(user);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Pendaftaran berhasil")));

    Navigator.pop(context, true); // Kirim sinyal ke list screen untuk refresh
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah User")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormConst(hintText: "Nama", controller: nameController),
              TextFormConst(hintText: "Email", controller: emailController),
              TextFormConst(
                hintText: "Password",
                controller: passwordController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: saveUser,
                child: const Text("Simpan Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
