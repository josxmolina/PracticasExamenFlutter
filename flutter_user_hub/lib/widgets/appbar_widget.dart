import 'package:flutter/material.dart';
import 'package:flutter_user_hub/core/app_colors.dart';
import 'package:flutter_user_hub/core/app_text.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String texto;

  const AppBarWidget({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      centerTitle: true,
      title: Text(texto, style: AppText().titulo),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
