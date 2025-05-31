import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class SimpleWeatherCard extends StatefulWidget {
  const SimpleWeatherCard({super.key});

  @override
  State<SimpleWeatherCard> createState() => _SimpleWeatherCardState();
}

class _SimpleWeatherCardState extends State<SimpleWeatherCard> {
  late String location;
  late String date;
  late String condition;
  late String tempRange;
  late String currentTemp;
  late IconData weatherIcon;

  final List<String> locations = ["রাজশাহী", "ঢাকা", "চট্টগ্রাম", "খুলনা", "সিলেট"];
  final List<String> conditions = ["আংশিক মেঘলা", "বৃষ্টি", "রোদ", "কুয়াশা", "বজ্রপাত"];

  @override
  void initState() {
    super.initState();
    _generateWeather();
    Timer.periodic(const Duration(minutes: 1), (timer) {
      _generateWeather();
    });
  }

  void _generateWeather() {
    final rand = Random();
    setState(() {
      location = locations[rand.nextInt(locations.length)];
      date = "${rand.nextInt(28) + 1} ${["মে", "জুন", "জুলাই"][rand.nextInt(3)]}";
      condition = conditions[rand.nextInt(conditions.length)];
      weatherIcon = _getIcon(condition);
      int minTemp = 24 + rand.nextInt(5);
      int maxTemp = minTemp + 5 + rand.nextInt(4);
      currentTemp = "${minTemp + rand.nextInt(maxTemp - minTemp + 1)}°C";
      tempRange = "$minTemp°C / $maxTemp°C";
    });
  }

  IconData _getIcon(String cond) {
    switch (cond) {
      case "রোদ":
        return Icons.wb_sunny_rounded;
      case "বৃষ্টি":
        return Icons.water_drop_rounded;
      case "আংশিক মেঘলা":
        return Icons.cloud_queue_rounded;
      case "কুয়াশা":
        return Icons.blur_on;
      case "বজ্রপাত":
        return Icons.flash_on;
      default:
        return Icons.wb_cloudy;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Container(
        width: double.infinity, // full width within padding
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.blue.shade100),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // LEFT SIDE: Weather Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$location, $date",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text("$condition • $tempRange",
                      style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(currentTemp,
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87)),
                      Icon(weatherIcon, color: Colors.orangeAccent, size: 30),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 16),

            // RIGHT SIDE: Spray Condition
            Container(
              width: 110,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.pink.shade100),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("স্প্রে করার শর্ত",
                      style: TextStyle(fontSize: 10, color: Colors.black54)),
                  const Text("প্রতিকূল",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87)),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("১০ PM পর্যন্ত",
                          style: TextStyle(fontSize: 11, color: Colors.black87)),
                      CircleAvatar(
                        backgroundColor: Color(0xFFFFC1D9),
                        radius: 10,
                        child: Icon(Icons.close, size: 14, color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
