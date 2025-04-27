import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: PhotoboothScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class PhotoboothScreen extends StatelessWidget {
  const PhotoboothScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFCA81), // top color
              Color(0xFF1F5A70), // bottom color
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('assets/photobooth.png'), // <<-- Asset image here
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Photobooth Di Paradise Beach Trombol',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Provided : Several Photobooth with Different Camera Background & Angles , Along with Many Accessories',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Comment :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'user12344: The best! There were many different backgrounds we could use!',
                        style: TextStyle(fontSize: 14),
                      ),
                      const Text(
                        'user1237: Great service!',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Text(
                            'Availability : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'AVAILABLE',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: List.generate(
                              5,
                                  (index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // Cart button action
                            },
                            icon: const Icon(
                              Icons.shopping_cart,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 25,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        // Close button action
                      },
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
