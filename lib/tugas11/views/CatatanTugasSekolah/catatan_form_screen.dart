import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas11/model/cacatan.dart';
import 'package:ppkdb3/tugas11/sqflite/db_helper.dart';

class CatatanFormScreen extends StatefulWidget {
  const CatatanFormScreen({super.key});

  @override
  State<CatatanFormScreen> createState() => _CatatanFormScreenState();
}

class _CatatanFormScreenState extends State<CatatanFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _namaPesertaController = TextEditingController();
  final _emailController = TextEditingController();
  final _namaEventController = TextEditingController();
  final _asalKotaController = TextEditingController();

  @override
  void dispose() {
    _namaPesertaController.dispose();
    _emailController.dispose();
    _namaEventController.dispose();
    _asalKotaController.dispose();
    super.dispose();
  }

  Future<void> _saveCatatan() async {
    if (_formKey.currentState!.validate()) {
      final catatan = Catatan(
        namaPeserta: _namaPesertaController.text,
        email: _emailController.text,
        namaEvent: _namaEventController.text,
        asalKota: _asalKotaController.text,
      );

      await DbHelper.insertCatatan(catatan);

      if (!mounted) return;
      Navigator.pop(context, true); // kembali dengan tanda sukses
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Catatan")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _namaPesertaController,
                decoration: const InputDecoration(labelText: "Nama Peserta"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Wajib diisi" : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    value == null || value.isEmpty ? "Wajib diisi" : null,
              ),
              TextFormField(
                controller: _namaEventController,
                decoration: const InputDecoration(labelText: "Nama Event"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Wajib diisi" : null,
              ),
              TextFormField(
                controller: _asalKotaController,
                decoration: const InputDecoration(labelText: "Asal Kota"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Wajib diisi" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveCatatan,
                child: const Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
