import 'package:flutter/material.dart';
import 'package:trombolbeach/adminoruser.dart';

void main() {
  runApp(const AdminOrUserScreen());
}

class UserLogIn extends StatelessWidget {
  const UserLogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/backgroundtb.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 200,
                    ),
                    const SizedBox(height: 50),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "EMAIL",
                        style: TextStyle(color: Colors.white, letterSpacing: 1),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Enter email",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "PASSWORD",
                        style: TextStyle(color: Colors.white, letterSpacing: 1),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          // TODO: Navigate to Forgot Password screen
                        },
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE3B97F),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'LOG IN',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}