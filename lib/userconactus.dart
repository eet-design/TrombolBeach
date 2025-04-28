import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ContactUsPage(),
    );
  }
}

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2E536F), // Top blue
              Color(0xFFB18454), // Bottom brown
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(1, 3),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Contact Us',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const TextFieldWidget(label: "EMAIL :"),
                const SizedBox(height: 20),
                const TextFieldWidget(label: "REF NO. :"),
                const SizedBox(height: 20),
                const TextFieldWidget(
                  label: "FEEDBACK :",
                  maxLines: 5,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Submit action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "SUBMIT",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const SocialMediaRow(
                  icon: Icons.camera_alt,
                  text: "paradisetrombolbeach",
                  color: Colors.pinkAccent,
                ),
                const SizedBox(height: 20),
                const SocialMediaRow(
                  icon: Icons.facebook,
                  text: "Paradise Trombol Beach",
                  color: Colors.blue,
                ),
                const SizedBox(height: 20),
                const SocialMediaRow(
                  icon: Icons.tiktok,
                  text: "paradisetrombolbeach",
                  color: Colors.black,
                ),
                const SizedBox(height: 20),
                const SocialMediaRow(
                  icon: Icons.phone,
                  text: "Ms. Alieya (016-8411358)\nMs. Erica (018-2102736)",
                  color: Colors.green,
                  isMultipleLines: true,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.label,
    this.maxLines = 1,
  });

  final String label;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            fillColor: Colors.grey.shade200.withOpacity(0.5),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

class SocialMediaRow extends StatelessWidget {
  const SocialMediaRow({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    this.isMultipleLines = false,
  });

  final IconData icon;
  final String text;
  final Color color;
  final bool isMultipleLines;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
          size: 30,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}