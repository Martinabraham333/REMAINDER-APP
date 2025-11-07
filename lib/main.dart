import 'package:flutter/material.dart';
import 'package:remainder_app/features/remainders/presentation/screens/add_remainder_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      scaffoldBackgroundColor:const Color.fromARGB(255, 3, 134, 8)
      ),
      home: const AddRemainderScreen()
    );
  }
}
