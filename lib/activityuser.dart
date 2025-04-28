import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Activity List',
      debugShowCheckedModeBanner: false,
      home: ActivityPage(),
    );
  }
}

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFCA81), Color(0xFF1F5A70)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Activity',
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.shopping_cart, color: Colors.black),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: const [
                    ActivityCard(
                      image: 'assets/photobooth.jpg',
                      title: 'Photobooth Di Paradise Beach Trombol',
                      description:
                      'Provided: Several Photobooth with Different Camera Backgrounds & Angles, Along with Many Accessories',
                      availability: 'AVAILABLE',
                      rating: 4,
                    ),
                    ActivityCard(
                      image: 'assets/horsejoy.jpg',
                      title: 'Horse Joy / Horse Ride',
                      description:
                      'Enjoy a horse ride and take pictures around Beach Trombol',
                      availability: 'AVAILABLE',
                      rating: 4,
                    ),
                    ActivityCard(
                      image: 'assets/pesta.jpg',
                      title: 'Pesta Paradise: Beach Trombol',
                      description:
                      'Many activities will be held, such as Zumba, Eco Run, Karaoke, and more at the beach. Come and join us!',
                      availability: 'NOT AVAILABLE',
                      rating: 4,
                    ),
                    ActivityCard(
                      image: 'assets/karaoke.jpg',
                      title: 'Karaoke Booths',
                      description:
                      'Show your musical talent at our karaoke booths while enjoying the beautiful beach view. Come and sing with us!',
                      availability: 'AVAILABLE',
                      rating: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String availability;
  final int rating;

  const ActivityCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.availability,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 6),
                Text(description,
                    style: const TextStyle(color: Colors.grey, fontSize: 14)),
                const SizedBox(height: 6),
                Text(
                  "Availability: $availability",
                  style: TextStyle(
                    color: availability == "AVAILABLE" ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: List.generate(
                    5,
                        (index) => Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: Colors.yellow[700],
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('View more'),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_shopping_cart),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
