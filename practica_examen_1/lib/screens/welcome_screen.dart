import 'package:flutter/material.dart';
import 'package:practica_examen_1/core/app_colors.dart';
import 'package:practica_examen_1/screens/form_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().background,
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/logo_gym.png'),
            Text(
              'Bienvenido a la app de registro!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors().text,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FormScreen()),
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: AppColors().button),
          child: Text(
            style: TextStyle(color: AppColors().text),
            'Registrar Usuario',
          ),
        ),
      ),
    );
  }
}
