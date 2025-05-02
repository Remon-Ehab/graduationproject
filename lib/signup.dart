import 'package:flutter/material.dart';
import 'package:graduationproject/appcolors.dart';

import 'destination.dart';
 // تأكد من استيراد صفحة الوجهات

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // محاكاة لعملية التسجيل (استبدل هذا بالمنطق الفعلي)
      await Future.delayed(const Duration(seconds: 2));

      setState(() => _isLoading = false);

      // الانتقال إلى صفحة الوجهات بعد التسجيل الناجح
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DestinationSelectionScreen(),
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create an account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),

                // حقل الاسم
                _buildTextField(
                  label: 'Name',
                  hint: 'Rimon Ehab',
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),

                // حقل الإيميل
                _buildTextField(
                  label: 'Email',
                  hint: 'rimon@gmail.com',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),

                // حقل كلمة المرور
                _buildPasswordField(
                  label: 'Password',
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  onToggleVisibility: () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),

                // حقل تأكيد كلمة المرور
                _buildPasswordField(
                  label: 'Confirm Password',
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  onToggleVisibility: () {
                    setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
                  },
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                // زر إنشاء الحساب
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _signUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.blueblue,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: AppColors.blueblue)
                        : const Text(
                      'Create account',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // رابط تسجيل الدخول
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      'Already have an account? Login',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white54),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white70),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            errorStyle: const TextStyle(color: Colors.orangeAccent),
          ),
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
    required String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white70),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.white70,
              ),
              onPressed: onToggleVisibility,
            ),
            errorStyle: const TextStyle(color: Colors.orangeAccent),
          ),
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}