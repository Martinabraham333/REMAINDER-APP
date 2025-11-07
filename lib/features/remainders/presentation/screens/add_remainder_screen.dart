import 'package:flutter/material.dart';

class AddRemainderScreen extends StatefulWidget {
  const AddRemainderScreen({super.key});

  @override
  State<AddRemainderScreen> createState() => _AddRemainderScreenState();
}

class _AddRemainderScreenState extends State<AddRemainderScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.1,
            vertical: height * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.05),
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                   borderSide: BorderSide.none,
                  
                  )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
