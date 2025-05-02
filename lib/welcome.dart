import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:graduationproject/appcolors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueblue,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // العنوان الرئيسي
            const Text(
              'Welcome To',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            // شعار Drive Mate
            const Text(
              'Drive Mate !',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),

            // زر تسجيل الدخول
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.blueblue,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),

            // زر التسجيل باستخدام جوجل
            SignInButton(
              Buttons.Google,
              text: "Continue with Google",
              onPressed: () {
                // TODO: تنفيذ تسجيل الدخول باستخدام جوجل
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            const SizedBox(height: 20),

            // زر إنشاء حساب جديد
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text(
                'Create account',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}