import 'package:flutter/material.dart';
import 'package:remainder_app/core/constants/app_colors.dart';
import 'package:remainder_app/features/connections/presentation/screens/connectons_screen.dart';
import 'package:remainder_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:remainder_app/features/remainders/presentation/screens/remainder_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            overlayColor: WidgetStateProperty.all(const Color.fromARGB(255, 194, 252, 247)),
            labelColor: AppColors.primaryColor, // Selected tab color
            unselectedLabelColor: Colors.grey, // Unselected tab color
            indicatorColor: AppColors.primaryColor, // Underline color
            tabs: [
              Tab(icon: Icon(Icons.notifications_active), text: 'Reminders'),
              Tab(icon: Icon(Icons.group), text: 'Connections'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
            ],
          ),
        ),
        body: TabBarView(
          children: [RemainderScreen(), ConnectonsScreen(), ProfileScreen()],
        ),
      ),
    );
  }
}
