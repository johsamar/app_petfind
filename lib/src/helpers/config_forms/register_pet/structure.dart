import 'package:app_petfind/src/helpers/config_forms/register_pet/validations.dart';
import 'package:app_petfind/src/models/InputModelForm.dart';
import 'package:flutter/material.dart';

/**
 * name
 * species
 * breed
 * color
 * size
 * age
 * details
 */

InputModel name(TextEditingController controller) {
  return InputModel(
    text: 'Nombre',
    controller: controller,
    icon: Icons.outbond,
    validator: validateName,
  );
}

InputModel details(TextEditingController controller) {
  return InputModel(
    text: 'Detalles',
    controller: controller,
    icon: Icons.person_outline,
    validator: validateName,
  );
}

InputModel specie(TextEditingController controller, String? selectedOption) {
  return InputModel(
    text: 'Especie',
    controller: controller,
    icon: Icons.abc,
    validator: validateSelect,
    selectedOption: selectedOption,
    options: ['Perro', 'Gato'],
  );
}

InputModel breed(
    TextEditingController controller, String? selectedOption, String? specie) {
  return InputModel(
    enabled: selectedOption == null,
    text: 'Raza',
    controller: controller,
    icon: Icons.abc,
    validator: validateSelect,
    selectedOption: selectedOption,
    options: specie == 'Perro' ? ['Labrador', 'Pitbull'] : ['Siames', 'Persa'],
  );
}

InputModel color(TextEditingController controller, String? selectedOption) {
  return InputModel(
      text: 'Color',
      controller: controller,
      icon: Icons.abc,
      validator: validateSelect,
      selectedOption: selectedOption,
      options: ["Pardo", "Amarillo", "Café", "Blanco"]);
}

InputModel size(TextEditingController controller, String? selectedOption) {
  return InputModel(
    text: 'Tamaño',
    controller: controller,
    icon: Icons.abc,
    validator: validateSelect,
    selectedOption: selectedOption,
    options: ['Pequeño', 'Mediano', 'Grande'],
  );
}

InputModel age(TextEditingController controller, String? selectedOption) {
  return InputModel(
    text: 'Edad',
    controller: controller,
    icon: Icons.abc,
    validator: validateSelect,
    selectedOption: selectedOption,
    options: ['Cachorro', 'Joven', 'Adulto', 'Viejo'],
  );
}
