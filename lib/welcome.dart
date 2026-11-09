import 'package:flutter/material.dart';
import 'dashboard.dart';

class CategoryItem {
  final String title;
  final IconData icon;
  bool isSelected;

  CategoryItem({
    required this.title,
    required this.icon,
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
  // Daftar kategori dengan ikon khusus untuk setiap pilihan
  final List<CategoryItem> categories = [
    CategoryItem(title: 'Personal Emails', icon: Icons.person),
    CategoryItem(title: 'Professional Emails', icon: Icons.work),
    CategoryItem(title: 'Newsletters', icon: Icons.article),
    CategoryItem(title: 'Announcement Emails', icon: Icons.campaign),
    CategoryItem(title: 'Promotional Emails', icon: Icons.local_offer),
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

              // pake ListWheelScrollView buat efek Carousel 
              Expanded(
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 90, // Tinggi setiap item di roda
                  perspective: 0.003, // Memberikan efek melengkung 3D carousel
                  diameterRatio: 1.5, // Ukuran lengkungan roda
                  physics: const FixedExtentScrollPhysics(), // Memastikan berhenti pas di tengah
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: categories.length,
                    builder: (context, index) {
                      final item = categories[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            item.isSelected = !item.isSelected;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: item.isSelected ? Colors.black : Colors.grey[100],
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: item.isSelected ? Colors.black : Colors.grey.shade300,
                              width: 1.5,
                            ),
                            boxShadow: [
                              if (item.isSelected)
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                )
                            ],
                          ),
                          child: Row(
                            children: [
                              // Kotak ikon yang lebih besar dengan ikon di dalamnya
                              Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: item.isSelected ? Colors.white.withOpacity(0.2) : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  item.icon,
                                  size: 28, // Ikon dibuat lebih besar
                                  color: item.isSelected ? Colors.white : Colors.grey[700],
                                ),
                              ),
                              const SizedBox(width: 16),
                              // Teks Kategori
                              Expanded(
                                child: Text(
                                 item.title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: item.isSelected ? Colors.white : Colors.black87,
                                  ),
                                ),
                              ),
                              // Indikator centang jika dipilih
                              if (item.isSelected)
                                const Icon(Icons.check_circle, color: Colors.white, size: 24),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 10),

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