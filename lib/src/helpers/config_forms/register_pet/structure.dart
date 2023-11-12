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
