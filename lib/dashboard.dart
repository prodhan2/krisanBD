import 'package:bagani_agi/pages/FertilizerCalculatorPage.dart';
import 'package:bagani_agi/pages/agriofficer.dart';
import 'package:bagani_agi/pages/chatbot.dart';
import 'package:bagani_agi/pages/circle.dart';
import 'package:bagani_agi/pages/deasedetection.dart';
import 'package:bagani_agi/pages/deases.dart';
import 'package:bagani_agi/pages/farmingadvice.dart';
import 'package:bagani_agi/pages/marketprice.dart';
import 'package:bagani_agi/pages/post.dart';
import 'package:bagani_agi/pages/shop.dart';
import 'package:bagani_agi/weatherprank.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(SmartFarmingApp());
}

class SmartFarmingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Farming',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NotoSansBengali',
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: Color(0xFF4CAF50),
          secondary: Color(0xFF8BC34A),
          surface: Color(0xFFF5F5F5),
          background: Color(0xFFFAFAFA),
        ),
      ),
      home: HomePage(),
      routes: {
        '/fertilizer': (context) => FertilizerCalculatorPage(),
        '/pests': (context) => PestsDiseasesPage(),
        '/advice': (context) => FarmingAdvicePage(),
        '/market': (context) => MarketPricesPage(),
        '/officer': (context) => AgricultureOfficerPage(),
        '/disease': (context) => DiseaseDetectionPage(),
        '/community': (context) => CommunityPage(),
        '/store': (context) => AgricultureShopApp(),
        '/chatbot': (context) => KrisanAIApp(),
         '/SmartAgriPage': (context) => SmartAgriPage(),
         '/cm': (context) =>CommunityPostPage()
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> crops = [
    {'icon': Icons.grass, 'name': 'আখ', 'color': Color(0xFF4CAF50)},
    {'icon': Icons.eco, 'name': 'আদা', 'color': Color(0xFF8BC34A)},
    {'icon': Icons.local_cafe, 'name': 'কফি', 'color': Color(0xFF795548)},
    {'icon': Icons.spa, 'name': 'শাক', 'color': Color(0xFF2E7D32)},
    {'icon': Icons.grain, 'name': 'ধান', 'color': Color(0xFFFBC02D)},
    {'icon': Icons.agriculture, 'name': 'গম', 'color': Color(0xFFCDDC39)},
    {'icon': Icons.forest, 'name': 'পাট', 'color': Color(0xFF5D4037)},
    {'icon': Icons.local_florist, 'name': 'সরিষা', 'color': Color(0xFFFFC107)},
    {'icon': Icons.park, 'name': 'আলু', 'color': Color(0xFFE64A19)},
    {'icon': Icons.emoji_food_beverage, 'name': 'চা', 'color': Color(0xFF3E2723)},
  ];

  final List<Map<String, dynamic>> utilities = [
    {'icon': Icons.calculate_outlined, 'title': 'সারের পরিমাণ\nহিসাবকারী', 'color': Color(0xFF2196F3), 'route': '/fertilizer'},
    {'icon': Icons.bug_report_outlined, 'title': 'বালাই এবং রোগ', 'color': Color(0xFFE91E63), 'route': '/pests'},
    {'icon': Icons.lightbulb_outline, 'title': 'চাষাবাদ সংক্রান্ত\nপরামর্শ', 'color': Color(0xFFFF9800), 'route': '/advice'},
    {'icon': Icons.insights_outlined, 'title': 'কীটপতঙ্গ ও রোগ\nসম্পর্কে তথ্য', 'color': Color(0xFF9C27B0), 'route': '/disease'},
    {'icon': Icons.contact_phone_outlined, 'title': 'কৃষি\nঅফিসার', 'color': Color(0xFF607D8B), 'route': '/officer'},
    {'icon': Icons.trending_up_outlined, 'title': 'বাজারের দর\nও পূর্বাভাস', 'color': Color(0xFF009688), 'route': '/market'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Text(
          "কৃষাণ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.person_outline),
            onPressed: () {
              print("Profile icon tapped");
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              print("Notification icon tapped");
            },
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                'কৃষাণ মেনু',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('হোম'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.agriculture),
              title: Text('কৃষি প্রযুক্তি'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.water_damage),
              title: Text('সেচ ব্যবস্থাপনা'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.thermostat),
              title: Text('আবহাওয়া তথ্য'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.grass),
              title: Text('ফসলের যত্ন'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('কৃষি পণ্য কেনাকাটা'),
              onTap: () {
                Navigator.pushNamed(context, '/store');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('অ্যাপ সম্পর্কে'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('লগ আউট'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/chatbot');
        },
        backgroundColor: Colors.white,
        child: Image.network(
          'https://i.postimg.cc/VLmHFmLT/image-removebg-preview.png',
          width: 100,
          height: 100,
          fit: BoxFit.contain,
        ),
        elevation: 4,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
              )],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'খুঁজুন...',
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.mic, color: Colors.grey),
                    onPressed: () {
                      // Add microphone functionality here
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Crop icons with horizontal scroll
            Text("আপনার ফসল নির্বাচন করুন", 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: crops.length,
              separatorBuilder: (_, __) => SizedBox(width: 12),
              itemBuilder: (context, index) {
                return Column(
                children: [
                  Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: crops[index]['color'], width: 2),
                  ),
                  child: Icon(crops[index]['icon'], size: 30, color: crops[index]['color']),
                  ),
                  SizedBox(height: 6),
                  Text(crops[index]['name'], style: TextStyle(fontSize: 12)),
                ],
                );
              },
              ),
            ),

            
            SizedBox(height: 24),

            // Weather Card
       
SimpleWeatherCard(),

            SizedBox(height: 24),

            // Disease Detection Section
            Text("আপনার ফসলকে রোগমুক্ত করুন", 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
          Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(
      color: const Color.fromARGB(255, 24, 255, 109).withOpacity(0.6), // Light neon border
      width: 2,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.cyanAccent.withOpacity(0.3), // Neon glow
        blurRadius: 12,
        spreadRadius: 1,
        offset: Offset(0, 4),
      ),
    ],
  ),
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _StepIcon(icon: Icons.camera_alt_outlined, label: "ছবি তুলুন"),
            Icon(Icons.arrow_forward_ios, color: Colors.grey),
            _StepIcon(icon: Icons.analytics_outlined, label: "লক্ষণ দেখুন"),
            Icon(Icons.arrow_forward_ios, color: Colors.grey),
            _StepIcon(icon: Icons.medical_services_outlined, label: "সমাধান"),
          ],
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/disease');
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Text(
              "একটা ছবি তুলুন",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
          ),
        ),
      ],
    ),
  ),
)
,

      SizedBox(height: 24),

      // Utility Cards Section
      GridView.count(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  crossAxisCount: 3, // 3 items per row
  childAspectRatio: 1.1,
  mainAxisSpacing: 12,
  crossAxisSpacing: 12,
  children: utilities.map((utility) {
  return Container(
    decoration: BoxDecoration(
    border: Border(
      left: BorderSide(color: Colors.green, width: 3),
      right: BorderSide(color: Colors.green, width: 3),
    ),
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
      color: Colors.green.withOpacity(0.3),
      blurRadius: 8,
      spreadRadius: 2,
      offset: Offset(0, 0),
      ),
    ],
    ),
    child: _UtilityCard(
    icon: utility['icon'],
    title: utility['title'],
    color: utility['color'],
    onTap: () {
      Navigator.pushNamed(context, utility['route']);
    },
    ),
  );
  }).toList(),
)



          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.greenAccent.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 16,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: BottomNavigationBar(
            onTap: (index) {
              if (index == 1) {
                Navigator.pushNamed(context, '/store');
              } else if (index == 2) {
                Navigator.pushNamed(context, '/chatbot');
              }
              else if (index == 3) {
                Navigator.pushNamed(context, '/cm'); // Home page
              }
              else if (index == 4) {
                Navigator.pushNamed(context, '/community');
              } else if (index == 5) {
                Navigator.pushNamed(context, '/SmartAgriPage'); // Assuming you have a settings page
              }
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            showUnselectedLabels: true,
            elevation: 0,
items: [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(Icons.home),
    label: "হোম",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.storefront_outlined),
    activeIcon: Icon(Icons.storefront),
    label: "দোকান",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.chat_bubble_outline),
    activeIcon: Icon(Icons.chat_bubble),
    label: "চ্যাটবট",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.group_outlined),
    activeIcon: Icon(Icons.group),
    label: "কমিউনিটি",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings_outlined),
    activeIcon: Icon(Icons.settings),
    label: "Monitoring",
  ),
]
          ),
        ),
      ),
    );
  }
}

// Utility Card Widget
class _UtilityCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback? onTap;

  const _UtilityCard({
    required this.icon, 
    required this.title, 
    required this.color,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, size: 28, color: color),
                  ),
                  SizedBox(height: 12),
                  Text(title, 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Step Icon Widget
class _StepIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StepIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 24, color: Theme.of(context).colorScheme.primary),
        ),
        SizedBox(height: 8),
        Text(label, 
            textAlign: TextAlign.center, 
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

// Community Page
class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('কৃষক কমিউনিটি'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text('কৃষক কমিউনিটি পৃষ্ঠা'),
      ),
    );
  }
}