import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/menu_model.dart';
import '../../widgets/custom_text.dart';
import 'add_menu_screen.dart';
import 'menu_detail_screen.dart';

class MenuListScreen extends StatefulWidget {
  const MenuListScreen({super.key});

  @override
  State<MenuListScreen> createState() => _MenuListScreenState();
}

class _MenuListScreenState extends State<MenuListScreen> {
  // 5 Data awal bertema Dessert sesuai ketentuan minimal soal UTS
  final List<MenuModel> _daftarMenu = [
    MenuModel(
      nama: 'Strawberry Cheesecake Slice',
      harga: 28000,
      imageUrl:
          'https://images.unsplash.com/photo-1533134242443-d4fd215305ad?auto=format&fit=crop&w=800&q=80',
    ),
    MenuModel(
      nama: 'Belgian Chocolate Lava Cake',
      harga: 32000,
      imageUrl:
          'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?auto=format&fit=crop&w=800&q=80',
    ),
    MenuModel(
      nama: 'Matcha Gelato Parfait',
      harga: 25000,
      imageUrl:
          'https://images.unsplash.com/photo-1563805042-7684c019e1cb?auto=format&fit=crop&w=800&q=80',
    ),
    MenuModel(
      nama: 'Classic Berry Crispy Waffle',
      harga: 24000,
      imageUrl:
          'https://images.unsplash.com/photo-1562376552-0d160a2f238d?auto=format&fit=crop&w=800&q=80',
    ),
    MenuModel(
      nama: 'French Vanilla Macaron Box',
      harga: 30000,
      imageUrl:
          'https://images.unsplash.com/photo-1558326567-98ae2405596b?auto=format&fit=crop&w=800&q=80',
    ),
  ];

  Future<void> _bukaHalamanTambah() async {
    final hasil = await Get.to(() => const AddMenuScreen());
    if (hasil != null && hasil is MenuModel) {
      setState(() {
        _daftarMenu.add(hasil);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Hierarki Widget sesuai Gambar 1:
    // Scaffold -> AppBar(Text), Column(Padding(Text), Expanded(ListView.builder -> Card -> ListTile(Icon, Text, Text, Icon))), FloatingActionButton(Icon)
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 101, 176),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const TeksKantin(
          isiTeks: 'Daftar Menu Dessert',
          ukuran: 18,
          ketebalan: FontWeight.bold,
          warna: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TeksKantin(
              isiTeks: 'Ketuk item dessert untuk melihat foto & detail hidangan:',
              ukuran: 14,
              ketebalan: FontWeight.w600,
              warna: Color(0xFF475569),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              itemCount: _daftarMenu.length,
              itemBuilder: (context, index) {
                final item = _daftarMenu[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    onTap: () {
                      Get.to(() => MenuDetailScreen(menu: item));
                    },
                    leading: const Icon(
                      Icons.cake_rounded,
                      color: Color.fromARGB(255, 238, 101, 176),
                    ),
                    title: TeksKantin(
                      isiTeks: item.nama,
                      ukuran: 16,
                      ketebalan: FontWeight.bold,
                    ),
                    subtitle: TeksKantin(
                      isiTeks: 'Rp ${item.harga}',
                      ukuran: 14,
                      ketebalan: FontWeight.w600,
                      warna: const Color.fromARGB(255, 238, 101, 176),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 233, 186, 171),
        onPressed: _bukaHalamanTambah,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}