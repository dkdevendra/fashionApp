import 'package:flutter/material.dart';
import 'package:helloworld/VarificationWithEmail.dart';

import 'VerificationScreen.dart';

class LoginWithEmail extends StatelessWidget {
  const LoginWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF8F5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Button
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child:
                  const Icon(Icons.arrow_back, size: 28, color: Colors.black),
            ),
            const SizedBox(height: 40),

            const Text(
              'Login with Email',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF121C2D),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Enter your email address to get verification code',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 30),

            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email Address',
                filled: true,
                fillColor: Colors.grey[200],
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            VerificationwithEmail())); // Continue with email logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child:
                  const Text('Sign in', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 24),

            const Center(
                child: Text("Or", style: TextStyle(color: Colors.black54))),
            const SizedBox(height: 24),

            _buildSocialButton(
              icon: Icons.apple,
              label: "Sign in with Apple",
              onPressed: () {
                // TODO: Add Apple Sign In logic
              },
            ),
            const SizedBox(height: 12),

            _buildSocialButton(
              imagePath: 'assets/images/google.png',
              label: "Sign in with Google",
              onPressed: () {
                // TODO: Add Google Sign In logic
              },
            ),
            const SizedBox(height: 12),

            _buildSocialButton(
              imagePath: 'assets/images/facebook.png',
              label: "Sign in with Facebook",
              onPressed: () {
                // TODO: Add Facebook Sign In logic
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    IconData? icon,
    String? imagePath,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF121C2D),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      child: Row(
        children: [
          if (icon != null)
            Icon(icon, color: Colors.white)
          else if (imagePath != null)
            Image.asset(imagePath, height: 24, width: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
        ],
      ),
    );
  }
}
