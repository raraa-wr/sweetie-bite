class MenuModel {
  final String nama;
  final int harga;
  final String imageUrl;

  MenuModel({
    required this.nama,
    required this.harga,
    required this.imageUrl,
  });

  // Fungsi otomatis memilih foto dessert berdasarkan kata kunci nama menu
  static String pilihFotoOtomatis(String namaMenu) {
    final lower = namaMenu.toLowerCase();
    if (lower.contains('cake') || lower.contains('cheesecake') || lower.contains('tiramisu') || lower.contains('kue')) {
      return 'https://images.unsplash.com/photo-1533134242443-d4fd215305ad?auto=format&fit=crop&w=800&q=80';
    } else if (lower.contains('ice') || lower.contains('es') || lower.contains('gelato') || lower.contains('sundae')) {
      return 'https://images.unsplash.com/photo-1563805042-7684c019e1cb?auto=format&fit=crop&w=800&q=80';
    } else if (lower.contains('choco') || lower.contains('cokelat') || lower.contains('brownie') || lower.contains('lava')) {
      return 'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?auto=format&fit=crop&w=800&q=80';
    } else if (lower.contains('waffle') || lower.contains('pancake') || lower.contains('crepe')) {
      return 'https://images.unsplash.com/photo-1562376552-0d160a2f238d?auto=format&fit=crop&w=800&q=80';
    }
    // Gambar default dessert (Macarons / Pastry)
    return 'https://images.unsplash.com/photo-1558326567-98ae2405596b?auto=format&fit=crop&w=800&q=80';
  }
}

// Penyimpanan user sederhana di memori untuk simulasi Login & Register
class AuthRepository {
  static final Map<String, String> _users = {
    'admin@untirta.ac.id': '123456',
  };

  static bool login(String email, String password) {
    return _users.containsKey(email) && _users[email] == password;
  }

  static void register(String email, String password) {
    _users[email] = password;
  }
}