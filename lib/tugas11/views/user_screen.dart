import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas11/model/user.dart';
import 'package:ppkdb3/tugas11/sqflite/db_helper.dart';
import 'package:ppkdb3/tugas11/views/user_form_Screen.dart';

class UserScreen extends StatefulWidget {
  static const String routeName = '/user_list_screen';
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  Future<void> getUsers() async {
    final dataUser = await DbHelper.getAllUsers();
    setState(() {
      users = dataUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar User")),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(child: Text(user.name[0])),
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigasi ke form input user
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const UserFormScreen()),
          );
          // Refresh data kalau ada perubahan
          if (result == true) {
            getUsers();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
