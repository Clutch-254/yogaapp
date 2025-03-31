
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:meditation/pages/user/breathing.dart';
import 'package:meditation/pages/user/homepage.dart';
import 'package:meditation/pages/user/meditation.dart';
import 'package:meditation/pages/user/profile.dart';
import 'package:meditation/pages/user/sleepuser.dart';
import 'package:meditation/pages/user/yogapage.dart';

// Import your pages here
// For example:
// import 'package:your_app/pages/homepage.dart';
// import 'package:your_app/pages/breathing.dart';
// etc.

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int currentTabIndex = 0;

  // Declare pages
  late List<Widget> pages;
  late Widget homepage;
  late Widget breathing;
  late Widget meditation;
  late Widget yoga;
  late Widget sleep;
  late Widget profile;

  @override
  void initState() {
    super.initState();
    
    // Initialize your pages
    // Replace these Placeholders with your actual page widgets when you have them
    homepage = Homepage(); // Replace with Homepage()
    breathing = Breathing(); // Replace with Breathing()
    meditation = Meditation(); // Replace with Meditation()
    yoga = Yogapage(); // Replace with Yoga()
    sleep = Sleepuser(); // Replace with Sleep()
    profile = ProfilePage(); // Replace with Profile()
    
    // Setup pages array
    pages = [homepage, breathing, meditation, yoga, sleep, profile];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: const Color(0xFF7E57C2), // Purple color matching wellness app theme
        buttonBackgroundColor: const Color(0xFF8C7AE6), // Slightly lighter for selection
        animationDuration: const Duration(milliseconds: 300),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: const [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.air, // For breathing
            color: Colors.white,
          ),
          Icon(
            Icons.spa, // For meditation
            color: Colors.white,
          ),
          Icon(
            Icons.self_improvement, // For yoga
            color: Colors.white,
          ),
          Icon(
            Icons.nightlight_round, // For sleep
            color: Colors.white,
          ),
          Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}