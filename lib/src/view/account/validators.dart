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

  if (value.length < 6) {
    return "The password must be at least 6 characters.";
  }

  return null;
}

String? validateName(String? value) {
      if (value!.isEmpty) {
        return 'The first name is required.';
      }
      return null;
    }
