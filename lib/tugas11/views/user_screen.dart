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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    // Dialog Edit User
                    final nameController = TextEditingController(
                      text: user.name,
                    );
                    final emailController = TextEditingController(
                      text: user.email,
                    );
                    final passwordController = TextEditingController(
                      text: user.password,
                    );

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Edit User'),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              TextField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  labelText: 'Nama',
                                ),
                              ),
                              TextField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                ),
                              ),
                              TextField(
                                controller: passwordController,
                                decoration: const InputDecoration(
                                  labelText: 'Password',
                                ),
                                obscureText: true,
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () async {
                              final updatedUser = User(
                                id: user.id!,
                                name: nameController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                              await DbHelper.updateUser(updatedUser);
                              getUsers();
                              Navigator.pop(context);
                            },
                            child: const Text('Simpan'),
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Batal'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await DbHelper.deleteUser(user.id!);
                    getUsers();
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const UserFormScreen()),
          );
          if (result == true) {
            getUsers();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
