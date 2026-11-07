
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 1. HEADER
              const Text(
                'Good Evening, Rhonda',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "Here's what you missed",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 24),

              // 2. STATISTICS CARD
              Card(
                elevation: 0,
                color: Colors.grey[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [

                        StatItem(
                          icon: Icons.article,
                          label: 'Newsletters',
                          count: '67',
                        ),

                        StatItem(
                          icon: Icons.person,
                          label: 'Personal',
                          count: '14',
                        ),

                        StatItem(
                          icon: Icons.calendar_today,
                          label: 'Deadlines',
                          count: '5',
                        ),

                        StatItem(
                          icon: Icons.groups,
                          label: 'Meetings',
                          count: '11',
                        ),

                        StatItem(
                          icon: Icons.local_shipping,
                          label: 'Delivery',
                          count: '18',
                        ),

                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 3. RECOMMENDATION CARD
              Card(
                elevation: 0,
                color: Colors.grey[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [

                      Container(
                        width: 4,
                        height: 85,
                        color: Colors.red,
                      ),

                      const SizedBox(width: 15),

                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            'You might want to see this!',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 12),

                          Text('• Check out our new release!'),

                          SizedBox(height: 8),

                          Text('• Assignment Due Today!'),

                        ],
                      ),

                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // 4. TODAY SECTION
              const Text(
                'Today',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              const TodayItem(
                icon: Icons.system_update,
                time: '8:00 PM',
                title: 'Software Update',
                subtitle: 'Google',
              ),

              const SizedBox(height: 10),

              const TodayItem(
                icon: Icons.school,
                time: '8:00 PM',
                title: 'Exams are coming up!',
                subtitle: 'Google Classroom',
              ),

              const SizedBox(height: 10),

              const TodayItem(
                icon: Icons.videogame_asset,
                time: '8:00 PM',
                title: 'Robux notification',
                subtitle: 'Roblox',
              ),

            ],
          ),
        ),
      ),

      // 5. BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Documents',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),

        ],
        currentIndex: 0,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}


// STATISTICS ITEM
class StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String count;

  const StatItem({
    super.key,
    required this.icon,
    required this.label,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [

          Icon(
            icon,
            size: 22,
            color: Colors.black,
          ),

          const SizedBox(height: 6),

          Text(
            count,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),

        ],
      ),
    );
  }
}


// TODAY NOTIFICATION ITEM
class TodayItem extends StatelessWidget {
  final IconData icon;
  final String time;
  final String title;
  final String subtitle;

  const TodayItem({
    super.key,
    required this.icon,
    required this.time,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),

      child: Row(
        children: [

          // ICON
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: 25,
              color: Colors.black,
            ),
          ),

          const SizedBox(width: 12),

          // NOTIFICATION TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
