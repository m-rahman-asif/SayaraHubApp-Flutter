import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              // Welcome Text
              const Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1E56D9)),
              ),
              const SizedBox(height: 8),
              const Text(
                "Your next opportunity is just a tap away.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 40),

              // Email/Phone Field
              _buildTextField(
                hint: "Enter your email or phone",
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 16),

             
Obx(() => _buildTextField(
  hint: "Password",
  icon: Icons.lock_outline,
  isPassword: true,
  obscureText: controller.isPasswordHidden.value,
  onSuffixIconTap: () => controller.togglePasswordVisibility(),
)),

              // Remember Me & Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
  children: [
    Obx(() => Checkbox(
      value: controller.isRememberMeChecked.value, 
      onChanged: (val) => controller.toggleRememberMe(val),
      activeColor: const Color(0xFF1E56D9), 
    )),
    const Text("Remember me"),
  ],
),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Forgot Password?", style: TextStyle(color: Color(0xFF1E56D9))),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Login Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {}, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E56D9),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
              const SizedBox(height: 30),

              // Divider
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Text("or")),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 30),

              // Social Logins
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialIcon(
                    "assets/google_logo.png", 
                    () => controller.loginWithGoogle(),
                  ),
                  const SizedBox(width: 20),
                  _socialIcon(
                    "assets/facebook_logo.png", 
                    () => controller.loginWithFacebook(),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Signup Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don’t have an account? "),
                  GestureDetector(
                    onTap: () {},
                    child: const Text("Signup", style: TextStyle(color: Color(0xFF1E56D9), fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
  required String hint, 
  required IconData icon, 
  bool isPassword = false, 
  bool obscureText = false, 
  VoidCallback? onSuffixIconTap, 
}) {
  return TextField(
    obscureText: isPassword ? obscureText : false,
    decoration: InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon),
      suffixIcon: isPassword 
        ? IconButton(
            icon: Icon(obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined),
            onPressed: onSuffixIconTap,
          ) 
        : null,
      filled: true,
      fillColor: const Color(0xFFF3F6FF),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

  Widget _socialIcon(String assetPath, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFF3F6FF),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Image.asset(assetPath, height: 30, width: 30),
      ),
    );
  }
}