import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class DrawerNavScreen extends StatefulWidget {
  const DrawerNavScreen({super.key});

  @override
  State<DrawerNavScreen> createState() => _DrawerNavScreenState();
}

class _DrawerNavScreenState extends State<DrawerNavScreen> {
  String _selectedItem = 'Beranda';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Navigation Demo'),
      ),
      // DRAWER WIDGET
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.primary,
              ),
              accountName: const Text(
                'Mas Rusdi',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              accountEmail: const Text('rusdi@warungkatalog.id'),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('MR', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 20)),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_rounded),
              title: const Text('Beranda'),
              selected: _selectedItem == 'Beranda',
              onTap: () {
                setState(() => _selectedItem = 'Beranda');
                Navigator.pop(context); // Close Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite_rounded),
              title: const Text('Menu Favorit'),
              selected: _selectedItem == 'Menu Favorit',
              onTap: () {
                setState(() => _selectedItem = 'Menu Favorit');
                Navigator.pop(context); // Close Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings_rounded),
              title: const Text('Pengaturan'),
              selected: _selectedItem == 'Pengaturan',
              onTap: () {
                setState(() => _selectedItem = 'Pengaturan');
                Navigator.pop(context); // Close Drawer
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout_rounded, color: AppColors.error),
              title: const Text('Keluar', style: TextStyle(color: AppColors.error)),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Aksi Keluar ditekan')),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.menu_open_rounded, size: 60, color: AppColors.primary),
              const SizedBox(height: 16),
              Text(
                'Halaman Aktif: $_selectedItem',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'Tarik dari sisi kiri layar atau tekan icon menu (hamburger) di pojok kiri atas untuk membuka Drawer.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textMuted),
              ),
              const SizedBox(height: 24),
              Builder(
                builder: (ctx) => ElevatedButton.icon(
                  onPressed: () => Scaffold.of(ctx).openDrawer(),
                  icon: const Icon(Icons.menu_rounded),
                  label: const Text('Buka Drawer via Tombol'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
