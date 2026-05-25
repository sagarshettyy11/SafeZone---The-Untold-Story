import 'package:flutter/material.dart';
import 'package:screen_testing/components/bottom_navigation.dart';
import 'package:screen_testing/screens/chatbot_screen.dart';
import 'package:screen_testing/screens/dashboard.dart';
import 'package:screen_testing/screens/emergency_help.dart';
import 'package:screen_testing/screens/profile_screen.dart';
import 'package:screen_testing/screens/report_complaint.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    SafetyDashboard(),
    SafeZoneChatbotScreen(),
    EmergencyHelpScreen(),
    ReportComplaintScreen(),
    ProfileScreen(),
  ];

  void _changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),

      bottomNavigationBar: FloatingBottomNav(
        selectedIndex: _selectedIndex,
        onTap: _changeTab,
      ),
    );
  }
}