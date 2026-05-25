import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController nameController =
    TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 360,
            padding: const EdgeInsets.all(28),

            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: Colors.white.withOpacity(0.05),
              ),
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                // Shield Icon
                Container(
                  height: 90,
                  width: 90,

                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(25),
                  ),

                  child: const Icon(
                    Icons.shield,
                    color: Colors.red,
                    size: 50,
                  ),
                ),

                const SizedBox(height: 25),

                // Title
                const Text(
                  "SENTINEL",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Secure Emergency Response System",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 40),

                Container(
  decoration: BoxDecoration(
    color: const Color(0xFF1A1A1A),
    borderRadius: BorderRadius.circular(14),

    border: Border.all(
      color: Colors.white12,
    ),
  ),

  child: TextField(
    controller: nameController,

    style: const TextStyle(
      color: Colors.white,
    ),

    decoration: const InputDecoration(
      hintText: "Full Name",

      hintStyle: TextStyle(
        color: Colors.grey,
      ),

      border: InputBorder.none,

      contentPadding: EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 18,
      ),
    ),
  ),
),

const SizedBox(height: 20),

                // Phone Field
                TextField(
                  style: const TextStyle(color: Colors.white),

                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),

                    hintText: "Phone Number",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),

                    filled: true,
                    fillColor: const Color(0xFF2A2A2A),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),

                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 18,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Password Field
                TextField(
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),

                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),

                    suffixIcon: const Icon(
                      Icons.visibility_off,
                      color: Colors.grey,
                    ),

                    hintText: "Password",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),

                    filled: true,
                    fillColor: const Color(0xFF2A2A2A),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),

                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 18,
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // Forgot Password
                const Align(
                  alignment: Alignment.centerRight,

                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Sign In Button
                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE53935),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    onPressed: () {

  Navigator.push(
    context,

    MaterialPageRoute(
      builder: (context) => HomeScreen(
  userName: nameController.text,
),
    ),
  );

},

                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // Biometric Login
                Column(
                  children: [

                    const Icon(
                      Icons.fingerprint,
                      color: Colors.red,
                      size: 40,
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Use Biometric Login",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Emergency Text
                const Text(
                  "In an emergency? Call 112",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}