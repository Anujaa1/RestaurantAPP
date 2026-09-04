import 'package:flutter/material.dart';

class WaiterHome extends StatelessWidget {
  const WaiterHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Waiter Dashboard'),
      ),

      body: const Center(
        child: Text(
          'Waiter Dashboard',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}