import 'package:flutter/material.dart';
import 'package:remainder_app/core/constants/app_colors.dart';
import 'package:remainder_app/core/widgets/custom_searchfield.dart';
import 'package:remainder_app/core/widgets/custom_text.dart';
import 'package:remainder_app/core/widgets/custom_textfield.dart';

class ConnectonsScreen extends StatefulWidget {
  const ConnectonsScreen({super.key});

  @override
  State<ConnectonsScreen> createState() => _ConnectonsScreenState();
}

class _ConnectonsScreenState extends State<ConnectonsScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            CustomText(
              text: 'Discover New Connections',
              color: AppColors.primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 20),
            CustomSearchField(
              controller: _searchController,
              hintText: 'Search By Email',
            ), 

            SizedBox(height: 20),
            CustomText(
              text: 'Connections',
              color: AppColors.primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
