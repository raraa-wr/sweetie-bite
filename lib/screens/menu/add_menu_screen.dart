import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/menu_model.dart';
import '../../widgets/custom_text.dart';

class AddMenuScreen extends StatefulWidget {
  const AddMenuScreen({super.key});

  @override
  State<AddMenuScreen> createState() => _AddMenuScreenState();
}

class _AddMenuScreenState extends State<AddMenuScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _hargaController = TextEditingController();

  void _simpanMenu() {
    if (_formKey.currentState!.validate()) {
      final namaInput = _namaController.text.trim();
      final hargaInput = int.parse(_hargaController.text.trim());

      final menuBaru = MenuModel(
        nama: namaInput,
        harga: hargaInput,
        imageUrl: MenuModel.pilihFotoOtomatis(namaInput),
      );

      Get.back(result: menuBaru);
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Hierarki Widget sesuai Gambar 2:
    // Scaffold -> AppBar(Text), Padding -> Form -> Column(TextFormField, SizedBox, TextFormField, SizedBox, ElevatedButton(Text))
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 101, 176),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const TeksKantin(
          isiTeks: 'Tambah Menu Dessert',
          ukuran: 18,
          ketebalan: FontWeight.bold,
          warna: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: 'Nama Menu',
                  hintText: 'Contoh: Caramel Pudding',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama menu tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _hargaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Harga Menu (Rp)',
                  hintText: 'Contoh: 15000',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Harga menu tidak boleh kosong';
                  }
                  final angka = int.tryParse(value.trim());
                  if (angka == null || angka <= 0) {
                    return 'Harga hanya boleh berisi angka yang valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 238, 101, 176),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _simpanMenu,
                child: const TeksKantin(
                  isiTeks: 'Simpan Menu',
                  ukuran: 16,
                  ketebalan: FontWeight.bold,
                  warna: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}