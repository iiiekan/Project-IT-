import 'package:flutter/material.dart';
import 'dashboard.dart';

class CategoryItem {
  final String title;
  bool isSelected;

  CategoryItem({
    required this.title,
    this.isSelected = false,
  });
}

class Welcome extends StatefulWidget {
  final String username;

  const Welcome({super.key, required this.username});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  // Daftar kategori sesuai wireframe
  final List<CategoryItem> categories = [
    CategoryItem(title: 'Personal Emails'),
    CategoryItem(title: 'Professional Emails'),
    CategoryItem(title: 'Newsletters'),
    CategoryItem(title: 'Announcement Emails'),
    CategoryItem(title: 'Promotional Emails'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                'Welcome,\n${widget.username}!',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Which type of emails do you prioritize?',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final item = categories[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          item.isSelected = !item.isSelected;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          children: [
                            // Kotak abu-abu di kiri
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: item.isSelected ? Colors.black : Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: item.isSelected
                                  ? const Icon(Icons.check, color: Colors.white)
                                  : null,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                item.title,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  backgroundColor: Colors.grey[800],
                  elevation: 0,
                  onPressed: () {
                    bool hasSelection = categories.any((element) => element.isSelected);
                    if (hasSelection) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardScreen(), 
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please select at least one option.')),
                      );
                    }
                  },
                  child: const Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}