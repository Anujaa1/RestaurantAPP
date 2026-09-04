import 'package:flutter/material.dart';

import '/models/models.dart';
import '/waiter/waiter_home.dart';
import '/chef/chef_home.dart';

class LoginScreen extends StatefulWidget {
  final UserRole role;

  const LoginScreen({
    super.key,
    required this.role,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void login() {

    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (widget.role == UserRole.waiter) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const WaiterHome(),
        ),
      );

    } else {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const ChefHome(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    final isWaiter = widget.role == UserRole.waiter;

    return Scaffold(

      appBar: AppBar(
        title: Text(
          isWaiter
              ? 'Waiter Login'
              : 'Chef Login',
        ),
      ),

      body: Center(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(24),

          child: Form(
            key: _formKey,

            child: Column(
              children: [

                Icon(
                  isWaiter
                      ? Icons.person
                      : Icons.restaurant_menu,

                  size: 80,

                  color: Colors.deepOrange,
                ),

                const SizedBox(height: 20),

                Text(
                  isWaiter
                      ? 'Welcome, Waiter!'
                      : 'Welcome, Chef!',

                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 40),

                TextFormField(

                  controller: usernameController,

                  decoration: const InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                  ),

                  validator: (value) {

                    if (value == null ||
                        value.trim().isEmpty) {

                      return 'Please enter username';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 18),

                TextFormField(

                  controller: passwordController,

                  obscureText: obscurePassword,

                  decoration: InputDecoration(
                    labelText: 'Password',

                    prefixIcon:
                    const Icon(Icons.lock),

                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),

                      onPressed: () {

                        setState(() {
                          obscurePassword =
                          !obscurePassword;
                        });

                      },
                    ),
                  ),

                  validator: (value) {

                    if (value == null ||
                        value.isEmpty) {

                      return 'Please enter password';
                    }

                    if (value.length < 4) {

                      return 'Password must be at least 4 characters';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    onPressed: login,

                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
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