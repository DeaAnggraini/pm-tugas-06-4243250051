import 'package:material_ui/material_ui.dart';

class Tentang extends StatelessWidget {
  const Tentang({super.key});

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang')),
      body: ListView(
        children: [
          SizedBox(
            height: 180,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ColoredBox(color: skema.primaryContainer),
                ),
                Positioned(
                  right: -20,
                  bottom: -24,
                  child: Icon(
                    Icons.landscape,
                    size: 160,
                    color: skema.primary.withValues(alpha: 0.2),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Text('Wisata Sumatera Utara', style: teks.headlineSmall),
                ),
              ],
            ),
          ),
          const ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Dea Anggraini'),
            subtitle: Text('4243250051 · Pemrograman Mobile · Tugas Rutin 6'),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Panduan destinasi wisata Sumatera Utara'),
            subtitle: Text('Responsif untuk ponsel dan tablet'),
          ),
        ],
      ),
    );
  }
}