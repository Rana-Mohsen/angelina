class Validators {
  static String? emailOrPhoneValidator(String? data) {
    if (data == null || data.isEmpty) {
      return 'Email or phone number is required';
    } else if (_isPhoneNumber(data) == false && _isEmail(data) == false) {
      return 'Enter a valid email or phone number';
    }
    return null;
  }

  static String? emailValidator(String? data) {
    if (data == null || data.isEmpty) {
      return 'Email is required';
    } else if (_isEmail(data) == false) {
      return 'Invalid email';
    }
    return null;
  }

  static String? phoneValidator(String? data) {
    if (data == null || data.isEmpty) {
      return 'Phone number is required';
    }
    return null;
  }

  static bool _isEmail(String data) {
    return data.contains('@') &&
        data.contains('.') &&
        data.indexOf('@') < data.lastIndexOf('.');
  }

  static bool _isPhoneNumber(String data) {
    final phoneRegex = RegExp(
      r'^\+?[0-9]{10,15}$',
    ); // Matches international phone numbers
    return phoneRegex.hasMatch(data);
  }

  static String? passwordValidator(String? data) {
    if (data!.isEmpty) {
      return 'password is required';
    } else if (data.length < 7) {
      return 'password is too short';
    }
    return null;
  }
}
