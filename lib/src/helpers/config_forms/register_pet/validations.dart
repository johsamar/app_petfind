String? validateName(String value) {
  if (value.isEmpty) {
    return 'El nombre es requerido';
  }
  if (value.length < 2) {
    return 'El nombre debe tener al menos 2 caracteres';
  }
  if (value.length > 20) {
    return 'El nombre debe tener menos de 25 caracteres';
  }
  return null;
}

String? validateDetails(String value){
  if (value.isEmpty) {
    return 'El detalle es requerido';
  }
  if (value.length < 8) {
    return 'El detalle debe tener al menos 8 caracteres';
  }
  if (value.length > 255) {
    return 'El detalle debe tener menos de 255 caracteres';
  }
  return null;
}

String? validateSelect(String value) {
  if (value.isEmpty) {
    return 'El tipo de especie es requerido';
  }
  return null;
}