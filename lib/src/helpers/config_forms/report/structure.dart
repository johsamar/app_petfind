import 'package:app_petfind/src/helpers/config_forms/register_pet/validations.dart';
import 'package:app_petfind/src/models/InputModelForm.dart';
import 'package:flutter/material.dart';

InputModel details(TextEditingController controller) {
  return InputModel(
    text: 'Detalles',
    controller: controller,
    icon: Icons.description,
    validator: validateName,
  );
}
