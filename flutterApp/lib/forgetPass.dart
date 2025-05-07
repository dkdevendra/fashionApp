import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helloworld/varifyForEmail.dart';

class ForgetPassword extends StatelessWidget {
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
                  'Forget Password',
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
                  'Enter your email address to get verification code',
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ),
              const SizedBox(height: 40),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VarifyEmail()),
                  ); // TODO: Sign in logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF121C2D),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child:
                    const Text('Send', style: TextStyle(color: Colors.white)),
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
