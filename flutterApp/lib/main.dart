import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'VerificationScreen.dart';

void main() {
  runApp(ShoppingAppWelcome());
}

class ShoppingAppWelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Welcome Page (1st Screen)
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFDFF2F1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/shopping.jpg',
                    height: 210,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Welcome!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Explore all the most exciting products\nbased on your interest and needs.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 33),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                    child: Text('Register'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF008C95),
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                    child: Text('Sign in'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: 34),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.chevron_left, color: Colors.grey),
                      Icon(Icons.chevron_right, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Sign In Page (2nd Screen with back arrow only)
class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background and form
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Color(0xFFDFF2F1)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 5), // space for back icon
                  Text(
                    'Hello!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Create your account to get started',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 5),
                  _buildTextField("First Name"),
                  SizedBox(height: 12),
                  _buildTextField("Middle Name"),
                  SizedBox(height: 12),
                  _buildTextField("Last Name"),
                  SizedBox(height: 12),
                  _buildTextField("Mobile Number"),
                  SizedBox(height: 12),
                  _buildTextField("Email Address"),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerificationScreen()),
                      );
                    },
                    child: Text('Sign in'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text("Or", style: TextStyle(color: Colors.black54)),
                  SizedBox(height: 16),
                  _buildSocialButton(
                    icon: Icons.apple,
                    label: "Sign in with Apple",
                    onPressed: () {},
                  ),
                  SizedBox(height: 12),
                  _buildSocialButton(
                    imagePath: 'assets/images/google.png',
                    label: "Sign in with Google",
                    onPressed: () {},
                  ),
                  SizedBox(height: 12),
                  _buildSocialButton(
                    imagePath: 'assets/images/facebook.png',
                    label: "Sign in with Facebook",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          // Back arrow only
          Positioned(
            top: 40,
            left: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, size: 28, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildSocialButton({
    IconData? icon,
    String? imagePath,
    required String label,
    required VoidCallback onPressed,
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: icon != null
          ? Icon(icon, size: 20)
          : Image.asset(imagePath!, height: 20),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: Colors.black),
        foregroundColor: Colors.black,
      ),
    );
  }
}
