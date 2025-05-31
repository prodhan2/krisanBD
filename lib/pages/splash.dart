import 'dart:async';
import 'package:bagani_agi/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(KrishanApp());
}

class KrishanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'কৃষাণ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>  SmartFarmingApp()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Static Image (No Animation)
            Image.network(
              'https://i.postimg.cc/t4Vsz9rd/Chat-GPT-Image-May-31-2025-12-33-17-PM-removebg-preview.png',
              height: 280,
              width: 280,
              errorBuilder: (context, error, stackTrace) => 
                Icon(Icons.agriculture, size: 80, color: Colors.green),
            ),
            
            SizedBox(height: 20),
            
            // App Name
            Text(
              'কৃষাণ',
              style: GoogleFonts.notoSansBengali(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: Colors.green[800],
              ),
            ),
            
            SizedBox(height: 8),
            
            // Tagline
            Text(
              'কৃষকের ডিজিটাল সহযোগী',
              style: GoogleFonts.hindSiliguri(
                fontSize: 14,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
            
            SizedBox(height: 40),
            
            // Simple Loading Indicator
            SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

