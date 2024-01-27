String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return "The email is required.";
  }

  if (!RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(value)) {
    return "The email is invalid.";
  }

  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return "The password is required.";
  }

  return null;
}
