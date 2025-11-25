import 'package:flutter/material.dart';

class ConnectionListScreen extends StatefulWidget {
  const ConnectionListScreen({super.key});

  @override
  State<ConnectionListScreen> createState() => _ConnectionListScreenState();
}

class _ConnectionListScreenState extends State<ConnectionListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('No connections')));
  }
}
