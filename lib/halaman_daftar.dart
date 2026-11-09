import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'data.dart';

class DaftarDestinasi extends StatelessWidget {
  const DaftarDestinasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wisata Sumatera Utara')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Jumlah kolom mengikuti ruang yang tersedia
          final kolom = switch (constraints.maxWidth) {
            < 600 => 2,
            < 900 => 3,
            _ => 4,
          };
          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: kolom,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemCount: daftarDestinasi.length,
            itemBuilder: (context, i) => KartuDestinasi(destinasi: daftarDestinasi[i]),
          );
        },
      ),
    );
  }
}

class KartuDestinasi extends StatelessWidget {
  const KartuDestinasi({super.key, required this.destinasi});

  final Destinasi destinasi;

  @override
  Widget build(BuildContext context) {
    final teks = Theme.of(context).textTheme;
    final d = destinasi;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.go('/destinasi/${d.id}'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: d.warna.withValues(alpha: 0.15),
                child: Icon(d.ikon, size: 56, color: d.warna),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(d.nama,
                      style: teks.titleSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  Text(d.lokasi,
                      style: teks.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  Text(d.tiket, style: teks.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}