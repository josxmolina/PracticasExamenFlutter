import 'package:flutter/material.dart';
import 'package:practica_examen_1/core/app_colors.dart'; // Asegúrate que esta ruta es correcta

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // 1. Clave global para el formulario
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  // 2. Corrección de Regex: Quitada la barra invertida antes del $
  final RegExp nameRegExp = RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]{2,100}$');
  final RegExp ageRegExp = RegExp(r'^(0?[1-9]|[1-9][0-9])$');

  String? valorSeleccionado;
  bool checkvalue = false; // Cambiado a no-nulo para facilitar lógica
  String mensajeErrorCheckbox = ""; // Para mostrar error del checkbox

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().background,
      appBar: AppBar(
        backgroundColor: AppColors().primary,
        title: Text(
          "Registro de Usuario",
          style: TextStyle(color: AppColors().text, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // 3. Envolver todo en un Form y asignar la key
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(color: AppColors().text),
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Nombre",
                  hintText: 'Ingresa tu nombre',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre es obligatorio';
                  }
                  if (!nameRegExp.hasMatch(value)) {
                    return 'Solo letras (min 2 caracteres)';
                  }
                  return null; 
                },
              ),
              SizedBox(height: 20),

              TextFormField(
                style: TextStyle(color: AppColors().text),
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Edad",
                  hintText: 'Ingresa tu edad',
                  prefixIcon: Icon(Icons.numbers),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La edad es obligatoria';
                  }
                  if (!ageRegExp.hasMatch(value)) {
                    return 'Edad inválida (1-99)';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("Tipo de Suscripción:",
                      style: TextStyle(color: AppColors().text)),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: valorSeleccionado,
                      hint: Text("Suscripción",
                          style: TextStyle(color: AppColors().text)),
                      items: [
                        DropdownMenuItem(
                            value: 'Anual',
                            child: Text('Anual',
                                style: TextStyle(color: AppColors().text))),
                        DropdownMenuItem(
                            value: 'Mensual',
                            child: Text('Mensual',
                                style: TextStyle(color: AppColors().text))),
                      ],
                      onChanged: (String? nuevoValor) {
                        setState(() {
                          valorSeleccionado = nuevoValor;
                        });
                      },
                      dropdownColor: AppColors().button,
                      validator: (value) {
                        if (value == null) return 'Selecciona uno';
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20),

              Row(
                children: [
                  Text("Acepto términos",
                      style: TextStyle(color: AppColors().text)),
                  Checkbox(
                    value: checkvalue,
                    onChanged: (bool? newValue) {
                      setState(() {
                        checkvalue = newValue ?? false;
                        mensajeErrorCheckbox = ""; // Limpiar error al tocar
                      });
                    },
                  ),
                ],
              ),
              if (mensajeErrorCheckbox.isNotEmpty)
                Text(
                  mensajeErrorCheckbox,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors().button),
                onPressed: _validar,
                child: Text("Validar",
                    style: TextStyle(color: AppColors().text)),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors().button),
                onPressed: _limpiar,
                child: Text("Limpiar",
                    style: TextStyle(color: AppColors().text)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _validar() {
    if (!checkvalue) {
      setState(() {
        mensajeErrorCheckbox = "Debes aceptar los términos";
      });
      _formKey.currentState!.validate(); 
      return;
    }

    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Formulario válido. Enviando datos...')),
      );
    }
  }

  void _limpiar() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _ageController.clear();
    setState(() {
      valorSeleccionado = null;
      checkvalue = false;
      mensajeErrorCheckbox = "";
    });
  }
}