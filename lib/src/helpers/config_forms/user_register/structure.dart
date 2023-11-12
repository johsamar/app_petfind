import 'package:app_petfind/src/helpers/config_forms/user_register/validations.dart';
import 'package:app_petfind/src/models/InputModelForm.dart';
import 'package:flutter/material.dart';

InputModel username(TextEditingController controller) {
  return InputModel(
    text: 'Nombre de usuario',
    controller: controller,
    icon: Icons.person_3_outlined,
    validator: validateUsername,
  );
}

InputModel name(TextEditingController controller) {
  return InputModel(
    text: 'Nombre',
    controller: controller,
    icon: Icons.person_outline,
    validator: validateName,
  );
}

InputModel email(TextEditingController controller) {
  return InputModel(
    text: 'Correo electrónico',
    controller: controller,
    icon: Icons.email_outlined,
    validator: validateEmail,
  );
}

InputModel password(TextEditingController controller) {
  return InputModel(
    text: 'Contraseña',
    controller: controller,
    icon: Icons.lock_outline,
    validator: validatePassword,
  );
}

InputModel phoneNumber(TextEditingController controller) {
  return InputModel(
    text: 'Número de teléfono',
    controller: controller,
    icon: Icons.phone_outlined,
    validator: validatePhoneNumber,
  );
}
