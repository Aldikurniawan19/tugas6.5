import 'package:flutter/material.dart';
import '../get_started/get_started_screen.dart'; // Import halaman Get Started

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Contoh Menu Setting Lainnya (Opsional)
            _buildSettingItem(
              icon: Icons.person_outline,
              title: 'Account Profile',
              onTap: () {},
            ),
            _buildSettingItem(
              icon: Icons.notifications_none,
              title: 'Notifications',
              onTap: () {},
            ),

            const Spacer(), // Mendorong tombol logout ke bawah
            // Tombol Logout
            Container(
              margin: const EdgeInsets.only(bottom: 32),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(
                  0.05,
                ), // Background merah sangat halus
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                onTap: () {
                  // Logika Navigasi Logout
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GetStartedScreen(),
                    ),
                    (route) =>
                        false, // Menghapus semua riwayat halaman sebelumnya
                  );
                },
                leading: const Icon(Icons.logout, color: Colors.redAccent),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget untuk item setting agar kode lebih rapi
  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: Colors.black87),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    );
  }
}
