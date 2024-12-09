import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  final String name;
  final String description;
  final double price;
  final int duration;
  final String userName;
  final String userEmail;

  BookingScreen({
    required this.name,
    required this.description,
    required this.price,
    required this.duration,
    required this.userName,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Service Name: $name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Description: $description", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Price: \$$price", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Duration: $duration minutes", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Provider: $userName", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Provider Email: $userEmail", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
