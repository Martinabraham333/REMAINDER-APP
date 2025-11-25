import 'package:flutter/material.dart';

class PendingConnectionScreen extends StatefulWidget {
  const PendingConnectionScreen({super.key});

  @override
  State<PendingConnectionScreen> createState() => _PendingConnectionScreenState();
}

class _PendingConnectionScreenState extends State<PendingConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('No pending connections')));
  }
}
