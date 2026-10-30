import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/menu_model.dart';
import '../../widgets/custom_text.dart';

class MenuDetailScreen extends StatelessWidget {
  final MenuModel menu;

  const MenuDetailScreen({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 101, 176),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const TeksKantin(
          isiTeks: 'Detail Hidangan',
          ukuran: 18,
          ketebalan: FontWeight.bold,
          warna: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                menu.imageUrl,
                width: double.infinity,
                height: 240,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 240,
                    color: Colors.orange.shade100,
                    child: const Icon(
                      Icons.broken_image_rounded,
                      size: 64,
                      color: Color.fromARGB(255, 238, 101, 176),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            const TeksKantin(
              isiTeks: 'Nama Menu',
              ukuran: 13,
              ketebalan: FontWeight.w500,
              warna: Colors.grey,
            ),
            const SizedBox(height: 4),
            TeksKantin(
              isiTeks: menu.nama,
              ukuran: 22,
              ketebalan: FontWeight.bold,
            ),
            const SizedBox(height: 16),
            const TeksKantin(
              isiTeks: 'Harga Satuan',
              ukuran: 13,
              ketebalan: FontWeight.w500,
              warna: Colors.grey,
            ),
            const SizedBox(height: 4),
            TeksKantin(
              isiTeks: 'Rp ${menu.harga}',
              ukuran: 20,
              ketebalan: FontWeight.bold,
              warna: const Color.fromARGB(255, 238, 101, 176),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 238, 101, 176),
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => Get.back(),
              child: const TeksKantin(
                isiTeks: 'Kembali ke Daftar Menu',
                ukuran: 15,
                ketebalan: FontWeight.bold,
                warna: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}