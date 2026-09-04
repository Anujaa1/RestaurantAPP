import 'package:flutter/material.dart';

class ChefHome extends StatelessWidget {
  const ChefHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chef Dashboard'),
      ),

      body: const Center(
        child: Text(
          'Chef Dashboard',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}