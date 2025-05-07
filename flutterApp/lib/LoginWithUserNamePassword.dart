import 'package:flutter/material.dart';
import 'package:helloworld/forgetPass.dart';

import 'AppScreen.dart';

class LoginWithUserNamePassword extends StatefulWidget {
  const LoginWithUserNamePassword({super.key});

  @override
  State<LoginWithUserNamePassword> createState() =>
      _LoginWithUserNamePasswordState();
}

class _LoginWithUserNamePasswordState extends State<LoginWithUserNamePassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF8F5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'User',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF121C2D),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Center(
                child: Text(
                  'Enter username and password',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              const SizedBox(height: 40),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.grey[300],
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() => _obscureText = !_obscureText);
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgetPassword()),
                    ); // TODO: Forget password logic
                  },
                  child: const Text('Forget password?'),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FashionHomePage()),
                  ); // TODO: Sign in logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF121C2D),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Get Start',
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 24),
              const Center(
                  child: Text("Or", style: TextStyle(color: Colors.black54))),
              const SizedBox(height: 24),
              _buildSocialButton(
                icon: Icons.apple,
                label: "Sign in with Apple",
                onPressed: () {},
                outlined: true,
              ),
              const SizedBox(height: 12),
              _buildSocialButton(
                imagePath: 'assets/images/google.png',
                label: "Sign in with Google",
                onPressed: () {},
                outlined: true,
              ),
              const SizedBox(height: 12),
              _buildSocialButton(
                imagePath: 'assets/images/facebook.png',
                label: "Sign in with Facebook",
                onPressed: () {},
                outlined: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    IconData? icon,
    String? imagePath,
    required String label,
    required VoidCallback onPressed,
    bool outlined = false,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        side: BorderSide(color: Colors.black.withOpacity(0.4)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      child: Row(
        children: [
          if (icon != null)
            Icon(icon, color: Colors.black)
          else if (imagePath != null)
            Image.asset(imagePath, height: 24, width: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
