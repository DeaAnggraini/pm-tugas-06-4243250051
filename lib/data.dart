import 'package:material_ui/material_ui.dart';

class Destinasi {
  const Destinasi({
    required this.id,
    required this.nama,
    required this.lokasi,
    required this.kategori,
    required this.deskripsi,
    required this.harga,
    required this.ikon,
    required this.warna,
  });

  final int id;
  final String nama;
  final String lokasi; // kabupaten/kota
  final String kategori;
  final String deskripsi;
  final int harga; // 0 = gratis
  final IconData ikon;
  final Color warna;

  String get tiket => harga == 0 ? 'Gratis' : harga.rupiah;
}

const daftarDestinasi = <Destinasi>[
  Destinasi(
    id: 1, nama: 'Danau Toba', lokasi: 'Samosir', kategori: 'Alam', harga: 0,
    deskripsi: 'Danau vulkanik terbesar di Asia Tenggara dengan Pulau Samosir di tengahnya.',
    ikon: Icons.landscape, warna: Color(0xFF0277BD),
  ),
  Destinasi(
    id: 2, nama: 'Bukit Lawang', lokasi: 'Langkat', kategori: 'Alam', harga: 10000,
    deskripsi: 'Gerbang Taman Nasional Gunung Leuser, terkenal dengan orangutan Sumatera.',
    ikon: Icons.forest, warna: Color(0xFF2E7D32),
  ),
  Destinasi(
    id: 3, nama: 'Berastagi', lokasi: 'Karo', kategori: 'Alam', harga: 0,
    deskripsi: 'Kota sejuk di kaki Gunung Sibayak dan Sinabung, terkenal dengan buah markisa.',
    ikon: Icons.terrain, warna: Color(0xFFEF6C00),
  ),
  Destinasi(
    id: 4, nama: 'Istana Maimun', lokasi: 'Medan', kategori: 'Sejarah', harga: 10000,
    deskripsi: 'Istana Kesultanan Deli bergaya Melayu, Eropa, dan India yang dibangun tahun 1888.',
    ikon: Icons.account_balance, warna: Color(0xFFF9A825),
  ),
  Destinasi(
    id: 5, nama: 'Air Terjun Sipiso-piso', lokasi: 'Karo', kategori: 'Alam', harga: 7500,
    deskripsi: 'Air terjun setinggi sekitar 120 meter di tepi utara Danau Toba.',
    ikon: Icons.waterfall_chart, warna: Color(0xFF00838F),
  ),
  Destinasi(
    id: 6, nama: 'Masjid Raya Al-Mashun', lokasi: 'Medan', kategori: 'Religi', harga: 0,
    deskripsi: 'Masjid bersejarah peninggalan Kesultanan Deli dengan arsitektur khas.',
    ikon: Icons.mosque, warna: Color(0xFF6A1B9A),
  ),
];

Destinasi? cariDestinasi(int id) {
  for (final d in daftarDestinasi) {
    if (d.id == id) return d;
  }
  return null;
}

extension Rupiah on int {
  String get rupiah {
    final pola = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return 'Rp${toString().replaceAllMapped(pola, (m) => '.')}';
  }
}