import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black87,
        ),
        actions: const [Icon(Icons.notifications_none_rounded)],
      ),
      body: const Center(
        child: Text(" Welcome to your home screen "),
      ),
    );
  }
}
