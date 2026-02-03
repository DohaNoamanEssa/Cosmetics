class InputValidator {
  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "Password Must be Not Empty";
    } else if (value.length < 7) {
      return "Password Must be at least 7 Digits";
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value!.isEmpty) {
      return "Phone Must be Not Empty";
    } else if (value.length < 10) {
      return "Phone Must be 10 Digits";
    }
    return null;
  }
}
