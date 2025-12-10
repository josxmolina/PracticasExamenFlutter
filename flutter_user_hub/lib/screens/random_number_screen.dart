import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_user_hub/core/app_colors.dart';
import 'package:flutter_user_hub/core/app_text.dart';
import 'package:flutter_user_hub/drawer_menu.dart';
import 'package:flutter_user_hub/widgets/appbar_widget.dart';

class RandomNumberScreen extends StatefulWidget {
  const RandomNumberScreen({super.key});

  @override
  State<RandomNumberScreen> createState() => _RandomNumberScreenState();
}

class _RandomNumberScreenState extends State<RandomNumberScreen> {
  int numeroAleatorio = Random().nextInt(100) + 1;
  final _formKey = GlobalKey<FormState>();
  final _numberController = TextEditingController();
  final RegExp randomPattern = RegExp(r'^([1-9][0-9]?|100)$');
  static int intentos = 10;
  static int numero = 0;
  String textoComprobar = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBarWidget(texto: "Adivina el número"),
      drawer: DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Instrucciones: Introduce un número valido del 1 a 100, tienes 10 intentos para averiguar",
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    style: TextStyle(color: AppColors.textPrimary),
                    controller: _numberController,
                    decoration: InputDecoration(
                      labelText: "Número",
                      hintText: 'Ingresa un número del 1 al 100',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.question_mark),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El número es obligatorio';
                      }
                      if (!randomPattern.hasMatch(value)) {
                        return 'números del 1 al 100';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate() && intentos > 0) {
                              numero = int.parse(_numberController.text);
                              _comprobar(numero);
                            }else if(intentos == 0){
                              setState(() {
                                textoComprobar = "Ya perdiste!!";
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.secondary,
                          ),
                          child: Text("Comprobar", style: AppText().textoNomal),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _restear();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                          ),
                          child: Text("Resetear", style: AppText().textoNomal),
                        ),
                      ),
                    ],
                  ),
                Text(textoComprobar, style: AppText().textoMedio),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _comprobar(int numero) {
    int resta = 10 - intentos;
    setState(() {
      if (numero == numeroAleatorio) {
        textoComprobar = "Acertaste en $resta intentos";
        intentos = 0;
      } else if (numero < numeroAleatorio) {
        textoComprobar =
            "El numero $numero es menor que el buscado $intentos restantes";
        intentos -= 1;
      } else {
        textoComprobar =
            "El numero $numero es mayor que el buscado $intentos restantes";
        intentos -= 1;
      }
    });
  }
  
  void _restear() {
    setState(() {
      numeroAleatorio = Random().nextInt(100) + 1;
      intentos = 10;
      _numberController.clear();
      textoComprobar ="Se reseteó mi rey";
    });
  }
}
