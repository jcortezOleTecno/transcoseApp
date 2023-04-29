String? validateEmail(String? value) {
  if (value!.isEmpty) {
    return 'Por favor ingrese su correo electrónico';
  }
  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
    return 'Por favor ingrese un correo electrónico válido';
  }
  return null;
}

String? validateData(String? value) {
  if (value!.isEmpty) {
    return 'Por favor complete este campo';
  }

  return null;
}
