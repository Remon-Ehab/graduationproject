import 'package:flutter/material.dart';
import 'package:graduationproject/appcolors.dart';

import 'destination.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // التحقق من صحة كلمة المرور
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // دالة تسجيل الدخول
  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      // إذا كانت البيانات صحيحة، يتم التنقل إلى الصفحة التالية
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
          builder: (context) => const DestinationSelectionScreen(),
    )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueblue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Login to your account...',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Welcome back',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 40),

              // حقل الإيميل
              _buildEmailField(),

              const SizedBox(height: 20),

              // حقل كلمة المرور
              _buildPasswordField(),

              const SizedBox(height: 30),

              // زر تسجيل الدخول
              _buildLoginButton(),

              const SizedBox(height: 20),

              // رابط إنشاء حساب جديد
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text(
                    'Don\'t have an account? Sign up',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIcon: const Icon(Icons.email, color: Colors.white70),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIcon: const Icon(Icons.lock, color: Colors.white70),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: const TextStyle(color: Colors.white),
      validator: _validatePassword,
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _login,
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
    );
  }
}
