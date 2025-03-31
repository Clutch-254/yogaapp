import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:meditation/pages/admin/clients.dart';
import 'package:meditation/pages/admin/homecli.dart';
import 'package:meditation/pages/admin/meditationad.dart';
import 'package:meditation/pages/admin/profilead.dart';
import 'package:meditation/pages/admin/schedule.dart';
import 'package:meditation/pages/admin/yogad.dart';

// You'll need to import your actual pages
// For example:
// import 'package:your_app/pages/admin/homepage.dart';
// import 'package:your_app/pages/admin/profile.dart';
// etc.

class Bottomadmin extends StatefulWidget {
  const Bottomadmin({super.key});

  @override
  State<Bottomadmin> createState() => _BottomadminState();
}

class _BottomadminState extends State<Bottomadmin> {
  int currentTabIndex = 0;

  // Declare pages
  late List<Widget> pages;
  late Widget homepage;
  late Widget profile;
  late Widget meditation;
  late Widget clients;
  late Widget yoga;
  late Widget schedule;

  @override
  void initState() {
    super.initState();
    
    // Initialize your admin pages
    // Replace these Placeholders with your actual page widgets when you have them
    homepage = Homecli(); // Replace with Homepage()
   
    meditation = Meditationad(); // Replace with MeditationAdmin()
    clients = Clients(); // Replace with ClientsPage()
    yoga = Yogad(); // Replace with YogaAdmin()
    schedule = Schedule(); // Replace with SchedulePage()
    profile = Profilead();
    
    // Setup pages array
    pages = [homepage, profile, meditation, clients, yoga, schedule];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: const Color(0xFF634FBD), // Purple color matching your admin theme
        buttonBackgroundColor: const Color(0xFF8C7AE6), // Slightly lighter for selection
        animationDuration: const Duration(milliseconds: 300),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: const [
          Icon(
            Icons.dashboard_outlined, // For homepage/dashboard
            color: Colors.white,
          ),
          Icon(
            Icons.person_outline, // For profile
            color: Colors.white,
          ),
          Icon(
            Icons.spa, // For meditation
            color: Colors.white,
          ),
          Icon(
            Icons.people_outline, // For clients
            color: Colors.white,
          ),
          Icon(
            Icons.self_improvement, // For yoga
            color: Colors.white,
          ),
          Icon(
            Icons.calendar_today_outlined, // For schedule
            color: Colors.white,
          ),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}