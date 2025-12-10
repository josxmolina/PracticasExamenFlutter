import 'package:flutter/material.dart';

class AppColors {
  // Constructor privado para evitar instanciar la clase
  AppColors._();

  // Colores Principales
  static const Color primary = Color(0xFF1565C0);      // Azul Intenso
  static const Color secondary = Color(0xFFFF6F00);    // Naranja/Ámbar
  
  // Fondos y Superficies
  static const Color background = Color.fromARGB(255, 214, 214, 214);   // Gris muy suave
  static const Color white = Colors.white;

  // Textos
  static const Color textPrimary = Color(0xFF212121);  // Gris casi negro
  static const Color textSecondary = Color(0xFF757575); // Gris medio

  // Feedback (Crucial para el ejercicio de Adivinar Número)
  static const Color success = Color(0xFF4CAF50);      // Verde
  static const Color error = Color(0xFFD32F2F);        // Rojo Alerta
}