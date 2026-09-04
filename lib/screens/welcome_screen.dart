import 'package:flutter/material.dart';

import 'login_screen.dart';
import '../models/models.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                // Restaurant icon
                Container(
                  height: 110,
                  width: 110,

                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(30),
                  ),

                  child: const Icon(
                    Icons.restaurant,
                    size: 60,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  'GoodFood',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Restaurant',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 60),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton.icon(
                    onPressed: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginScreen(
                            role: UserRole.waiter,
                          ),
                        ),
                      );

                    },

                    icon: const Icon(Icons.person),

                    label: const Text(
                      'Login as Waiter',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: OutlinedButton.icon(
                    onPressed: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginScreen(
                            role: UserRole.chef,
                          ),
                        ),
                      );

                    },

                    icon: const Icon(Icons.restaurant_menu),

                    label: const Text(
                      'Login as Chef',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}