
import 'package:flutter/material.dart';

void main() {
  runApp(MyBookingApp());
}

class MyBookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Arial'),
      home: ActivityListScreen(),
    );
  }
}

class ActivityListScreen extends StatefulWidget {
  @override
  _ActivityListScreenState createState() => _ActivityListScreenState();
}

class _ActivityListScreenState extends State<ActivityListScreen> {
  List<Map<String, dynamic>> activities = [
    {
      'title': 'Photobooth Di Paradise Beach Trombol',
      'price': 10,
      'rating': 5,
      'description': 'Enjoy various photobooth styles with different backgrounds and props.',
      'image': 'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
    },
    {
      'title': 'Horse Joy / Horse Ride',
      'price': 15,
      'rating': 4,
      'description': 'Experience the joy of riding horses along the beach.',
      'image': 'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
    },
    {
      'title': 'New Paradise Beach Trombol',
      'price': 20,
      'rating': 5,
      'description': 'Relax at a beautiful beach with stunning views.',
      'image': 'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
    },
    {
      'title': 'Karaoke Booth',
      'price': 12,
      'rating': 4,
      'description': 'Sing your heart out in a private karaoke booth.',
      'image': 'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
    },
  ];

  List<Map<String, dynamic>> cart = [];

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
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Stack(
                      children: [
                        IconButton(
                          icon: Icon(Icons.shopping_cart_outlined, size: 28),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartScreen(cart: cart),
                              ),
                            );
                          },
                        ),
                        if (cart.isNotEmpty)
                          Positioned(
                            right: 4,
                            top: 4,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '${cart.length}',
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ),
                          )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: activities.length,
                  itemBuilder: (context, index) {
                    var activity = activities[index];
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ActivityDetailScreen(activity: activity),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  activity['image'],
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(activity['title'], style: TextStyle(fontWeight: FontWeight.bold)),
                                    SizedBox(height: 4),
                                    Text(activity['description'], maxLines: 2, overflow: TextOverflow.ellipsis),
                                    SizedBox(height: 4),
                                    Text("Price: RM${activity['price']}", style: TextStyle(color: Colors.red)),
                                    Row(
                                      children: List.generate(
                                        activity['rating'],
                                            (i) => Icon(Icons.star, color: Colors.amber, size: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
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

// Activity Detail Screen
class ActivityDetailScreen extends StatefulWidget {
  final Map<String, dynamic> activity;

  ActivityDetailScreen({required this.activity});

  @override
  _ActivityDetailScreenState createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.activity['title']),
        backgroundColor: Color(0xFF1F5A70),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    widget.activity['image'],
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.activity['title'],
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.activity['description'],
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text('Price: RM${widget.activity['price']}',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Quantity:', style: TextStyle(fontSize: 18)),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                if (quantity > 1) {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              },
                            ),
                            Text(quantity.toString(), style: TextStyle(fontSize: 18)),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Add to cart functionality can be implemented here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SuccessScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                      ),
                      child: Text('ADD TO CART', style: TextStyle(fontSize: 16)),
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

// Success Screen
class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFCA81),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 120),
            SizedBox(height: 20),
            Text(
              "SUCCESSFULLY ADDED",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(Icons.close, color: Colors.white, size: 30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Cart Screen
class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cart;

  CartScreen({required this.cart});

  @override
  Widget build(BuildContext context) {
    double total = cart.fold(0, (sum, item) => sum + item['price']);
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
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Booking Cart (${cart.length})",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    TextButton(
                      onPressed: () {}, // Define what happens on EDIT
                      child: Text("EDIT"),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    var item = cart[index];
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(12),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            item['image'],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              return const Icon(Icons.error);
                            },
                          ),
                        ),
                        title: Text(item['title']),
                        subtitle: Text("RM${item['price']}"),
                        trailing: Text("x1"),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("TOTAL: RM${total.toStringAsFixed(2)}",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    ElevatedButton(
                      onPressed: () {}, // Define check out functionality here
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Text("Check Out"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}