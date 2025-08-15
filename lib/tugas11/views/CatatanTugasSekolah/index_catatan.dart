import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas11/model/cacatan.dart';
import 'package:ppkdb3/tugas11/sqflite/db_helper.dart';
import 'package:ppkdb3/tugas11/views/CatatanTugasSekolah/catatan_form_screen.dart';

class CatatanScreen extends StatefulWidget {
  static const String routeName = '/catatan_list_screen';
  const CatatanScreen({super.key});

  @override
  State<CatatanScreen> createState() => _CatatanScreenState();
}

class _CatatanScreenState extends State<CatatanScreen> {
  List<Catatan> catatanList = [];

  @override
  void initState() {
    super.initState();
    getCatatan();
  }

  Future<void> getCatatan() async {
    final data = await DbHelper.getAllCatatan();
    setState(() {
      catatanList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Catatan")),
      body: ListView.builder(
        itemCount: catatanList.length,
        itemBuilder: (context, index) {
          final catatan = catatanList[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    catatan.namaPeserta,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text("Email: ${catatan.email}"),
                  Text("Event: ${catatan.namaEvent}"),
                  Text("Asal Kota: ${catatan.asalKota}"),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          // Dialog Edit
                          showDialog(
                            context: context,
                            builder: (context) {
                              final namaController = TextEditingController(
                                text: catatan.namaPeserta,
                              );
                              final emailController = TextEditingController(
                                text: catatan.email,
                              );
                              final eventController = TextEditingController(
                                text: catatan.namaEvent,
                              );
                              final kotaController = TextEditingController(
                                text: catatan.asalKota,
                              );

                              return AlertDialog(
                                title: const Text("Edit Catatan"),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      TextField(
                                        controller: namaController,
                                        decoration: const InputDecoration(
                                          labelText: "Nama Peserta",
                                        ),
                                      ),
                                      TextField(
                                        controller: emailController,
                                        decoration: const InputDecoration(
                                          labelText: "Email",
                                        ),
                                      ),
                                      TextField(
                                        controller: eventController,
                                        decoration: const InputDecoration(
                                          labelText: "Nama Event",
                                        ),
                                      ),
                                      TextField(
                                        controller: kotaController,
                                        decoration: const InputDecoration(
                                          labelText: "Asal Kota",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      final updatedCatatan = Catatan(
                                        id: catatan.id!,
                                        namaPeserta: namaController.text.trim(),
                                        email: emailController.text.trim(),
                                        namaEvent: eventController.text.trim(),
                                        asalKota: kotaController.text.trim(),
                                      );
                                      await DbHelper.updateCatatan(
                                        updatedCatatan,
                                      );
                                      getCatatan();
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Simpan'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Batal'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await DbHelper.deleteCatatan(catatan.id!);
                          getCatatan();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CatatanFormScreen()),
          );
          if (result == true) {
            getCatatan();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
