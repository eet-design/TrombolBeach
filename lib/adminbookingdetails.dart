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
          child: Stack(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(10),
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
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Table(
                          border: TableBorder.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                          columnWidths: const {
                            0: FixedColumnWidth(40),
                            1: FixedColumnWidth(160),
                            2: FixedColumnWidth(100),
                            3: FixedColumnWidth(130),
                            4: FixedColumnWidth(100),
                            5: FixedColumnWidth(120),
                          },
                          children: [
                            TableRow(
                              decoration: const BoxDecoration(color: Color(0xFFE0F2F1)),
                              children: [
                                tableCellBold(''),
                                tableCellBold('Email'),
                                tableCellBold('Name'),
                                tableCellBold('Activity Selected'),
                                tableCellBold('Date'),
                                tableCellBold('Payment Status'),
                              ],
                            ),
                            buildTableRow(
                              index: 1,
                              email: 'eet@gmail.com',
                              name: 'Eri',
                              activity: 'Horse Ride',
                              date: '10/4/2025',
                              status: 'Successful',
                              highlight: false,
                            ),
                            buildTableRow(
                              index: 2,
                              email: 'aisy@yahoo.com',
                              name: 'Aisy',
                              activity: 'Karaoke',
                              date: '10/4/2025',
                              status: 'Pending',
                              highlight: true,
                            ),
                            buildTableRow(
                              index: 3,
                              email: 'aa@mail.com',
                              name: 'Ali',
                              activity: 'Photobooth',
                              date: '11/4/2025',
                              status: 'Successful',
                              highlight: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 30,
                right: 20,
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.person_add, size: 30, color: Colors.black),
                      onPressed: () {
                        print('Add User Clicked');
                      },
                    ),
                    const SizedBox(height: 10),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          print('Edit User Clicked');
                        },
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Stack(
                            alignment: Alignment.center,
                            children: const [
                              Icon(Icons.person, size: 30, color: Colors.black),
                              Positioned(
                                bottom: 2,
                                right: 0,
                                child: Icon(Icons.edit, size: 15, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    IconButton(
                      icon: const Icon(Icons.delete, size: 30, color: Colors.black),
                      onPressed: () {
                        print('Delete Clicked');
                      },
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

  static Widget tableCellBold(String text) {
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  static TableRow buildTableRow({
    required int index,
    required String email,
    required String name,
    required String activity,
    required String date,
    required String status,
    required bool highlight,
  }) {
    final bgColor = highlight ? Colors.yellowAccent : Colors.white;
    return TableRow(
      decoration: BoxDecoration(color: bgColor),
      children: [
        tableCell(index.toString()),
        tableCell(email),
        tableCell(name),
        tableCell(activity),
        tableCell(date),
        tableCell(status),
      ],
    );
  }

  static Widget tableCell(String text) {
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
