import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'profile_screen.dart';

class InboxScreen extends StatelessWidget {
  final String username;

  const InboxScreen({super.key, this.username = 'Rhonda'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Inbox', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Kartu Utama Atas
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning_amber_rounded, size: 36, color: Colors.black),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('IT - 12 [X] Class', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Chip(label: Text('5 Emails', style: TextStyle(fontSize: 10))),
                          ],
                        ),
                        const Text('To: student@altaglobalsch.com', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        const Text('Mon, 17 Aug 2026, 08.27 AM', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // ListView untuk Daftar Pesan
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.warning, color: Colors.black),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('IT - 12 [X] Class', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text('Mon, 17 Aug 2026, 08.27 AM', style: TextStyle(fontSize: 12, color: Colors.grey)),
                              Text('Hi apakabar, jangan lupa tugasnya~', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // BOTTOM NAVIGATION BAR DI INBOX SCREEN
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 1, // Indeks 1 untuk Inbox (tengah)
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          if (index == 0) {
            // Kembali ke Home / Dashboard
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen(username: username)),
            );
          } else if (index == 2) {
            // Pindah ke Profile
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen(username: username)),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline), // Ikon Inbox di tengah
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Ikon Profile
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}