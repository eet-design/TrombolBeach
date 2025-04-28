import 'package:flutter/material.dart';

void main() {
  runApp(const BookingListApp());
}

class BookingListApp extends StatelessWidget {
  const BookingListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BookingListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BookingListScreen extends StatelessWidget {
  const BookingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF527B87),
              Color(0xFFFFD59E),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'BOOKING DETAILS',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      headingRowColor: MaterialStateProperty.all(const Color(0xFFE0F2F1)),
                      dataRowColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.amberAccent;
                        }
                        return null;
                      }),
                      columns: const [
                        DataColumn(label: Text('No.', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Email', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Activity', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Actions', style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                      rows: bookings.map((booking) {
                        return DataRow(
                          color: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                            if (booking['status'] == 'Pending') {
                              return Colors.yellowAccent; // Row becomes yellow if pending
                            }
                            return Colors.white; // Otherwise, normal white
                          }),
                          cells: [
                            DataCell(
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AdminBookingDetails(bookingDetails: booking),
                                    ),
                                  );
                                },
                                child: Text(
                                  booking['index'].toString(),
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            DataCell(Text(booking['email'])),
                            DataCell(Text(booking['name'])),
                            DataCell(Text(booking['activity'])),
                            DataCell(Text(booking['date'])),
                            DataCell(Text(
                              booking['status'],
                              style: TextStyle(
                                color: booking['status'] == 'Successful' ? Colors.green : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            DataCell(Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit, color: Colors.blue, size: 18),
                                  onPressed: () {
                                    print('Edit ${booking['name']}');
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red, size: 18),
                                  onPressed: () {
                                    print('Delete ${booking['name']}');
                                  },
                                ),
                              ],
                            )),
                          ],
                        );
                      }).toList(),

                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdminBookingDetails extends StatelessWidget {
  final Map<String, dynamic> bookingDetails;

  const AdminBookingDetails({super.key, required this.bookingDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('No.: ${bookingDetails['index']}', style: const TextStyle(fontSize: 18)),
            Text('Email: ${bookingDetails['email']}', style: const TextStyle(fontSize: 18)),
            Text('Name: ${bookingDetails['name']}', style: const TextStyle(fontSize: 18)),
            Text('Activity: ${bookingDetails['activity']}', style: const TextStyle(fontSize: 18)),
            Text('Date: ${bookingDetails['date']}', style: const TextStyle(fontSize: 18)),
            Text('Status: ${bookingDetails['status']}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

// Mock data
final List<Map<String, dynamic>> bookings = [
  {
    "index": 1,
    "email": "eet@gmail.com",
    "name": "Eri",
    "activity": "Horse Ride",
    "date": "10/4/2025",
    "status": "Successful",
  },
  {
    "index": 2,
    "email": "aisy@yahoo.com",
    "name": "Aisy",
    "activity": "Karaoke",
    "date": "10/4/2025",
    "status": "Pending",
  },
  {
    "index": 3,
    "email": "aa@mail.com",
    "name": "Ali",
    "activity": "Photobooth",
    "date": "11/4/2025",
    "status": "Successful",
  },
];