import 'package:client/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:client/features/auth/view/widgets/custom_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      'Welcome Musifly',
      style: TextStyle(
        fontSize: 40,
      ),
    ),
  ),
  centerTitle: true,
),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const CustomField(
              hintText: 'Username',
            ),
            const SizedBox(height: 15),
            const CustomField(
              hintText: 'Password',
            ),
            const SizedBox(height: 15),
            const CustomField(
              hintText: 'Email',
            ),
            const SizedBox(height: 20),
            const AuthGradientButton(),
            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(
                text: 'Already have an account? ',
                style: TextStyle(
                    color: Colors.white), // Set the default color to white
                children: [
                  TextSpan(
                    text: 'Sign In',
                    style: TextStyle(
                      color: Colors
                          .blue, // Optional: Set a different color for "Sign In"
                      fontWeight: FontWeight.bold, // Optional: Make it bold
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
