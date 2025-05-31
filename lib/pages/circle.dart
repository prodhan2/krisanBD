import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SmartAgriPage(),
  ));
}

class SmartAgriPage extends StatelessWidget {
  const SmartAgriPage({Key? key}) : super(key: key);

  final String imageUrl = 'https://i.postimg.cc/bYSCtBb7/image.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9F4),
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: const Text(
          'স্মার্ট কৃষি', // Smart Agriculture
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 6,
        shadowColor: Colors.green.shade300,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // নোটিফিকেশন দেখুন
              // View notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // সেটিংস মেনু
              // Settings menu
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWide = constraints.maxWidth > 700;

          return isWide
              ? Row(
                  children: [
                    Expanded(child: buildImage()),
                    Expanded(child: buildFeatureList()),
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      buildImage(),
                      buildFeatureList(),
                    ],
                  ),
                );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'হোম', // Home
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'বিশ্লেষণ', // Analytics
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'প্রোফাইল', // Profile
          ),
        ],
        selectedItemColor: Colors.green.shade800,
      ),
    );
  }

  // 🌿 Image section with dummy weather data
  Widget buildImage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text(
                          'ঢাকা, বাংলাদেশ', // Dhaka, Bangladesh
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Dummy weather data
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildWeatherItem(Icons.thermostat, '৩২°C', 'তাপমাত্রা'), // 32°C, Temperature
                _buildWeatherItem(Icons.water_drop, '৬৫%', 'আর্দ্রতা'), // 65%, Humidity
                _buildWeatherItem(Icons.air, '১০ km/h', 'বাতাস'), // 10 km/h, Wind
                _buildWeatherItem(Icons.wb_sunny, 'সূর্যালোক', 'পরিষ্কার'), // Sunny, Clear
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.green.shade700),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green.shade800,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  // 📋 Feature List with dummy data
  Widget buildFeatureList() {
    final List<Map<String, dynamic>> features = [
      {
        'title': 'ক্ষেত্র পর্যবেক্ষণ', // Field Monitoring
        'description': 'মাটির অবস্থা ও ফসলের তথ্য বাস্তব সময়ে দেখুন।', // Track real-time soil & crop data
        'icon': Icons.grass,
        'color': Colors.lightGreen,
        'dummyData': '৫টি সেন্সর সক্রিয়', // 5 sensors active
      },
      {
        'title': 'ফসল ব্যবস্থাপনা', // Crop Management
        'description': 'বিভিন্ন ফসলের তথ্য ও যত্ন দেখুন।', // View and manage crops
        'icon': Icons.spa,
        'color': Colors.teal,
        'dummyData': '৮টি ফসল রেকর্ড', // 8 crop records
      },
      {
        'title': 'স্বয়ংক্রিয় সেচ', // Irrigation Automation
        'description': 'স্বয়ংক্রিয়ভাবে পানি দেওয়ার সময়সূচী।', // Automated water scheduling
        'icon': Icons.opacity,
        'color': Colors.blue,
        'dummyData': 'পরবর্তী সেচ: ৬ ঘন্টা পরে', // Next irrigation: 6 hours later
      },
      {
        'title': 'রোগ পূর্বাভাস', // Disease Prediction
        'description': 'ফসলের রোগ আগে থেকে শনাক্ত করুন।', // Detect crop diseases early
        'icon': Icons.health_and_safety,
        'color': Colors.orange,
        'dummyData': 'কোন রোগ শনাক্ত হয়নি', // No diseases detected
      },
      {
        'title': 'সার ব্যবস্থাপনা', // Fertilizer Management
        'description': 'সার প্রয়োগের সুপারিশ পান।', // Get fertilizer recommendations
        'icon': Icons.eco,
        'color': Colors.brown,
        'dummyData': 'পরবর্তী সার: ৩ দিন পরে', // Next fertilizer: 3 days later
      },
      {
        'title': 'ফসল ভবিষ্যদ্বাণী', // Yield Prediction
        'description': 'আপনার ফসলের ফলন অনুমান করুন।', // Estimate your crop yield
        'icon': Icons.trending_up,
        'color': Colors.purple,
        'dummyData': 'প্রত্যাশিত ফলন: ২৫০ কেজি', // Expected yield: 250kg
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: Text(
              'সুবিধাসমূহ', // Features
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade800,
              ),
            ),
          ),
          ...features.map((feature) => buildFeatureCard(feature)).toList(),
          const SizedBox(height: 16),
          // Dummy news section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.new_releases, color: Colors.green.shade800),
                    const SizedBox(width: 8),
                    Text(
                      'কৃষি সংবাদ', // Agriculture News
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade800,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'আজকের আবহাওয়া: সম্পূর্ণ সূর্যালোক, বৃষ্টির সম্ভাবনা নেই। বোরো ধান চাষের জন্য উপযুক্ত সময়।', // Today's weather: Full sunshine, no chance of rain. Good time for Boro rice cultivation.
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ✨ Enhanced Feature Card with dummy data
  Widget buildFeatureCard(Map<String, dynamic> feature) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4)),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: feature['color'].withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            feature['icon'],
            color: feature['color'],
          ),
        ),
        title: Text(
          feature['title'],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              feature['description'],
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 4),
            Text(
              feature['dummyData'],
              style: TextStyle(
                color: Colors.green.shade700,
                fontSize: 12,
              ),
            ),
          ],
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.green.shade800,
        ),
        onTap: () {
          // ফিচার ডিটেইলস দেখুন
          // View feature details
        },
      ),
    );
  }
}