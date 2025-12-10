import 'package:flutter/material.dart';
import 'package:flutter_user_hub/core/app_colors.dart';
import 'package:flutter_user_hub/core/app_text.dart';
import 'package:flutter_user_hub/screens/profile_screen.dart';
import 'package:flutter_user_hub/screens/random_number_screen.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.primary),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 4.0),
                    ),
                    child: ClipOval(
                      child: Image.asset("assets/homer.jpg", height: 80),
                    ),
                  ),
                ),
                Text("josxmolinaa", style: AppText().textoMedio,)
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.info, color: AppColors.textPrimary),
            title: Text("Mi Perfil", style: AppText().textoNomal),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PerfilScreen()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.numbers, color: AppColors.textPrimary),
            title: Text("Adivina el número", style: AppText().textoNomal),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RandomNumberScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
