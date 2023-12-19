
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