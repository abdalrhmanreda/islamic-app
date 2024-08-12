bool isPasswordValid(String password) {
  if (!password.contains(RegExp(r'[A-Z]'))) {
    return false;
  }

  if (!password.contains(RegExp(r'[a-z]'))) {
    return false;
  }

  if (!password.contains(RegExp(r'[0-9]'))) {
    return false;
  }

  if (!password.contains(RegExp(r'[!@#\$%^&*]'))) {
    return false;
  } else {
    return true;
  }
}
