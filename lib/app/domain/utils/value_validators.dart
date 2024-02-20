Map<String, dynamic> validateEmailAddress({required String email}) {
  Map<String, dynamic> result = {'valid' : false, 'sms' : 'No es valido.'};
  const emailRegex =
  r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(email)) {
    result['valid'] = true;
    result['sms'] = 'Email valido.';
    return result;
  } else {
    result['valid'] = false;
    result['sms'] = 'Formato de email no válido';
    return result;
  }
}