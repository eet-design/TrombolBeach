// ignore_for_file: file_names

import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class Message {
  final String text;
  final bool isSentByUser;

  Message({required this.text, required this.isSentByUser});
}

class ChatScreen extends StatelessWidget {
  final List<Message> messages = [
    Message(
      text:
      "Hi! I just booked an activity in your website, I wanted to know if my booking has been receive.",
      isSentByUser: true,
    ),
    Message(
      text: "Hi there! Yes your booking has been confirmed",
      isSentByUser: false,
    ),
    Message(
      text: "Good to heard that! Thank you so much!",
      isSentByUser: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(child: _buildMessagesList()),
            _buildInputField(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      color: Colors.blueGrey.shade700,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
          SizedBox(width: 10),
          CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
                'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg'), // Make sure to add an image here!
          ),
          SizedBox(width: 10),
          Text(
            'REF NO. : #123',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesList() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blueGrey.shade100,
            Colors.blueGrey.shade200,
            Colors.blueGrey.shade300,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return Align(
            alignment: message.isSentByUser
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: message.isSentByUser
                    ? Colors.lightBlue.shade100
                    : Colors.lightGreen.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                message.text,
                style: TextStyle(fontSize: 14),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      color: Colors.blueGrey.shade700,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Colors.blueGrey.shade900,
            child: Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }
}