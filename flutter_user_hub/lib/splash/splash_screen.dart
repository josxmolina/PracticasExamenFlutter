import 'package:flutter/material.dart';
import 'package:flutter_user_hub/core/app_colors.dart';
import 'package:flutter_user_hub/core/app_text.dart';
import 'package:flutter_user_hub/screens/profile_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  void _navigateHome() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => PerfilScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset("assets/gif_pato.gif", height: 250,),
            SizedBox(height: 40,),
            Text("Bienvenidos a todos a mi app", style: AppText().titulo, textAlign: TextAlign.center)
          ],
        ),
        ),
      ),
    );
  }
}
