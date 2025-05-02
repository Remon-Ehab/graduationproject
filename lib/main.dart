import 'package:flutter/material.dart';
import 'package:graduationproject/ridedistination.dart';
import 'package:graduationproject/ridedistination.dart';
import 'package:graduationproject/signup.dart';
import 'package:graduationproject/welcome.dart';

import 'Splash_Screen.dart';
import 'destination.dart';
import 'loginscreen.dart';
import 'onboarding.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drive Mate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
      routes: {
        '/onboarding': (context) => const OnboardingScreens(),
        '/login': (context) => const LoginScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/destination': (context) => const DestinationSelectionScreen(),


      },
    );
  }
}