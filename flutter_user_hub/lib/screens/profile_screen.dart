import 'package:flutter/material.dart';
import 'package:flutter_user_hub/core/app_colors.dart';
import 'package:flutter_user_hub/core/app_text.dart';
import 'package:flutter_user_hub/drawer_menu.dart';
import 'package:flutter_user_hub/widgets/appbar_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double imageSize = size.shortestSide * 0.5;
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBarWidget(texto: "Perfil"),
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 4.0),
                ),
                child: ClipOval(
                  child: Image.asset("assets/homer.jpg",height: imageSize,),
                ),
              ),
            ),
            Text("josxmolinaa", style: AppText().textoGrande),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse('https://github.com/josxmolina');
                if (await canLaunchUrl(url)) {
                  launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Text("Link a git"),
            ),
          ],
        ),
      ),
    );
  }
}
