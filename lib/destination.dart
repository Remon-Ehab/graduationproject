import 'package:flutter/material.dart';

class DestinationSelectionScreen extends StatelessWidget {
  const DestinationSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية (ممكن تحط صورة خريطة أو Google Map هنا)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/mapbg.jpg'), // ضع صورة الخريطة هنا
                fit: BoxFit.cover,
              ),
            ),
          ),

          // الطبقة اللي فوق الخريطة
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF0B2240), // لون خلفية داكن
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Choose your destination',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // حقل بداية الرحلة
                  buildInputField(
                    icon: Icons.location_on,
                    iconColor: Colors.blue,
                    hint: 'Enter Start location',
                  ),
                  const SizedBox(height: 15),

                  // حقل الذهاب
                  buildInputField(
                    icon: Icons.place,
                    iconColor: Colors.red,
                    hint: 'Where to go',
                  ),
                  const SizedBox(height: 15),

                  // حقل الوجهة
                  buildInputField(
                    icon: Icons.flag,
                    iconColor: Colors.green,
                    hint: 'Destination',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ويدجت مخصص لحقل الإدخال
  Widget buildInputField({required IconData icon, required Color iconColor, required String hint}) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: iconColor),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: const Color(0xFF163060), // لون الحقل
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
