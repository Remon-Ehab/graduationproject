import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RideConfirmationScreen extends StatelessWidget {
  final String destinationName;

  const RideConfirmationScreen({super.key, required this.destinationName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Your Ride'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle_outline, size: 100, color: Colors.green),
              const SizedBox(height: 20),
              Text(
                'You have selected:',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                destinationName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  // هنا ممكن تضيف منطق تأكيد الرحلة
                  Navigator.pop(context); // يرجع للشاشة السابقة
                },
                icon: Icon(Icons.check),
                label: Text('Confirm Ride'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
