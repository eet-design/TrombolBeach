import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ActivityScreen(),
    );
  }
}

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  static final List<Map<String, dynamic>> activities = [
    {
      "image": "assets/photobooth.jpg",
      "title": "Photobooth Di Paradise Beach Trombol",
      "description": "Provided: Several Photobooth with Different Camera Background & Angles, Along with Many Accessories",
      "availability": "AVAILABLE",
      "price": 10,
      "rating": 5,
    },
    {
      "image": "assets/horsejoy.jpg",
      "title": "Horse Joy / Horse Ride",
      "description": "Enjoy a horse ride and take pictures around Beach Trombol",
      "availability": "AVAILABLE",
      "price": 15,
      "rating": 4,
    },
    {
      "image": "assets/pesta.jpg",
      "title": "Pesta Paradise: Beach Trombol",
      "description": "Many activities will be held, such as Zumba, Eco Run, karaoke, and more at the beach. Come and join us!",
      "availability": "NOT AVAILABLE",
      "price": 20,
      "rating": 4,
    },
    {
      "image": "assets/karaoke.jpg",
      "title": "Karaoke Booth",
      "description": "Show your musical talent at our karaoke booth while enjoying the beautiful beach view. Come and sing with us!",
      "availability": "AVAILABLE",
      "price": 5,
      "rating": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFCA81), // light top
              Color(0xFF1F5A70), // dark bottom
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SearchBar(),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: activities.length,
                  itemBuilder: (context, index) {
                    final activity = activities[index];
                    return ActivityCard(activity: activity);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.arrow_back, size: 30),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(178),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search Activity',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        const Icon(Icons.search, size: 30),
        Stack(
          alignment: Alignment.topRight,
          children: [
            const Icon(Icons.shopping_cart, size: 35),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Text(
                '1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ActivityCard extends StatelessWidget {
  final Map<String, dynamic> activity;

  const ActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(
              activity['image'],
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    activity['description'],
                    style: const TextStyle(fontSize: 11),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "Availability : ",
                        style: TextStyle(fontSize: 11, color: Colors.grey[700]),
                      ),
                      Text(
                        activity['availability'],
                        style: TextStyle(
                          fontSize: 11,
                          color: activity['availability'] == "AVAILABLE"
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: List.generate(
                      activity['rating'],
                          (index) => const Icon(Icons.star, color: Colors.amber, size: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                const Icon(Icons.edit, size: 18, color: Colors.red),
                const SizedBox(height: 5),
                const Icon(Icons.shopping_cart_checkout, size: 18),
              ],
            ),
          ],
        ),
      ),
    );
  }
}