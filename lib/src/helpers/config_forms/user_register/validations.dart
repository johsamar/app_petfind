String? validateUsername(String value) {
  if (value.isEmpty) {
    return 'El nombre es requerido';
  }
  if (value.length < 8) {
    return 'El nombre debe tener al menos 8 caracteres';
  }
  if (value.length > 20) {
    return 'El nombre debe tener menos de 25 caracteres';
  }
  return null;
}

String? validateName(String value) {
  if (value.isEmpty) {
    return 'El nombre es requerido';
  }
  if (value.length < 8) {
    return 'El nombre debe tener al menos 8 caracteres';
  }
  if (value.length > 20) {
    return 'El nombre debe tener menos de 25 caracteres';
  }
  return null;
}

String? validateEmail(String value) {
  if (value.isEmpty) {
    return 'El correo electrónico es requerido';
  }
  if (!value.contains('@')) {
    return 'El correo electrónico debe contener un @';
  }
  if (!value.contains('.')) {
    return 'El correo electrónico debe contener un punto';
  }
  return null;
}

String? validatePassword(String value) {
  if (value.isEmpty) {
    return 'La contraseña es requerida';
  }
  if (value.length < 8) {
    return 'La contraseña debe tener al menos 8 caracteres';
  }
  if (value.length > 20) {
    return 'La contraseña debe tener menos de 25 caracteres';
  }
  return null;
}

String? validatePhoneNumber(String value) {
  if (value.isEmpty) {
    return 'El número de teléfono es requerido';
  }
  if (value.length < 8) {
    return 'El número de teléfono debe tener al menos 8 caracteres';
  }
  if (value.length > 20) {
    return 'El número de teléfono debe tener menos de 25 caracteres';
  }
  return null;
}

