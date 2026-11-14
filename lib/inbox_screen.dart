import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'profile_screen.dart';

class EmailItem {
  final String title;
  final String sender;
  final String time;
  final String preview;
  final IconData icon;

  EmailItem({
    required this.title,
    required this.sender,
    required this.time,
    required this.preview,
    required this.icon,
  });
}

class InboxScreen extends StatefulWidget {
  final String username;

  const InboxScreen({super.key, this.username = 'Rhonda'});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  // Daftar email dengan kategori bervariasi yang bisa disusun ulang
  final List<EmailItem> _emails = [
    EmailItem(
      title: 'Weekly Tech Newsletter',
      sender: 'news@technews.com',
      time: 'Mon, 17 Aug 2026, 09.00 AM',
      preview: 'Check out the top 10 frameworks to learn this year...',
      icon: Icons.article,
    ),
    EmailItem(
      title: 'Family Dinner Plan',
      sender: 'mom@gmail.com',
      time: 'Mon, 17 Aug 2026, 08.45 AM',
      preview: 'Don’t forget to bring the dessert we discussed...',
      icon: Icons.person,
    ),
    EmailItem(
      title: 'Project Milestone Meeting',
      sender: 'boss@altaglobalsch.com',
      time: 'Mon, 17 Aug 2026, 08.30 AM',
      preview: 'We will review the final prototype presentation tomorrow morning.',
      icon: Icons.groups,
    ),
    EmailItem(
      title: 'Package Delivery Update',
      sender: 'support@delivery.com',
      time: 'Mon, 17 Aug 2026, 08.15 AM',
      preview: 'Your order has been shipped and is out for delivery today.',
      icon: Icons.local_shipping,
    ),
    EmailItem(
      title: 'Security Alert: New Sign-in',
      sender: 'security@account.google.com',
      time: 'Mon, 17 Aug 2026, 08.00 AM',
      preview: 'We noticed a new login from an iOS device in your area.',
      icon: Icons.security,
    ),
  ];

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Info ringkas petunjuk interaksi
            const Text(
              'Drag and drop items to reorder your priority inbox categories:',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 12),

            // ReorderableListView agar email bisa disusun ulang secara manual
            Expanded(
              child: ReorderableListView.builder(
                itemCount: _emails.length,
                onReorderItem: (oldIndex, newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final EmailItem item = _emails.removeAt(oldIndex);
                    _emails.insert(newIndex, item);
                  });
                },
                itemBuilder: (context, index) {
                  final email = _emails[index];
                  return Container(
                    key: ValueKey(email.title + index.toString()),
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(email.icon, color: Colors.black, size: 28),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                email.title,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                email.sender,
                                style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                email.preview,
                                style: const TextStyle(fontSize: 12, color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                email.time,
                                style: const TextStyle(fontSize: 10, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Handle icon penanda bisa digeser
                        const Icon(Icons.drag_handle, color: Colors.grey),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 1, // Indeks 1 untuk Inbox (tengah)
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen(username: widget.username)),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen(username: widget.username)),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}