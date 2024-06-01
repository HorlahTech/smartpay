mixin ValidationMixin {
  String? validateNotEmpty(String? value) =>
      value != null && value.isEmpty ? 'Field cannot be empty' : null;

  String? validateFullName(String? fullName) {
    if (fullName != null && fullName.isEmpty) {
      return 'Fullname field cannot be empty';
    }

    if (fullName != null && fullName.split(' ').length < 2) {
      return 'Fullname field should contain first and last name';
    }
    return null;
  }

  String? validateEmail(String? email) {
    if (email != null) {
      if (email.isEmpty) return 'Email field cannot be empty';
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      if (!emailValid) return 'Enter a Valid Email Address';
    }
    return null;
  }

  // String? validateFundingAmount(String? value) {
  //   if (value != null) {
  //     if (value.isEmpty) return 'Field cannot be empty';
  //     if (int.parse(CurrencyUtil.getAmount(value)) < 100) {
  //       return 'Amount must be more than 100';
  //     }
  //   }
  //   return null;
  // }

  // String? validatePhoneNumber(String? phoneNumber) {
  //   if ((phoneNumber != null && phoneNumber.length < 10)) {
  //     return 'Enter a Valid Phone Number';
  //   }
  //   if (phoneNumber != null && phoneNumber.length != 11) {
  //     return 'Enter a Valid Phone Number';
  //   }
  //   return null;
  // }

  // String? validatePhoneNumber1(PhoneNumber? phoneNumber) {
  //   if ((phoneNumber != null && phoneNumber.number.length < 10)) {
  //     return 'Enter a Valid Phone Number';
  //   }
  //   if (phoneNumber != null && phoneNumber.number.length > 11) {
  //     return 'Enter a Valid Phone Number';
  //   }
  //   return null;
  // }

  String? validatePhoneNumber(String? value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value == null || value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value) || value.length < 9) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password != null) {
      if (password.isEmpty) return 'Password field cannot be empty';
      if (password.length < 8) return 'Please field should be greater than 6';
    }
    return null;
  }

  String? validateConfirmPassword(String? password, confirmPassword) {
    if (password != null) {
      if (password.isEmpty) return 'Password field cannot be empty';
      if (password == confirmPassword) {
        return 'Please field should be greater than 6';
      }
    }
    return null;
  }

  String? validatePasscode(String? password) {
    if (password != null) {
      if (password.isEmpty) return 'Passcode field cannot be empty';
      if (password.length != 6) return 'Please field should be 6 digits';
    }
    return null;
  }

  String? validatePasswordStrict(String? password) {
    if (password != null) {
      if (password.isEmpty) {
        return 'Password field cannot be empty';
      }
      bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
      bool hasDigits = password.contains(RegExp(r'[0-9]'));
      bool hasLowercase = password.contains(RegExp(r'[a-z]'));
      bool hasMinLength = password.length >= 8;
      if (!hasDigits) {
        return "Password must Contain digit";
      } else if (!hasUppercase) {
        return "Password must Contain Uppercase letter";
      } else if (!hasLowercase) {
        return "Password must Contain Lowercase letter";
      } else if (!hasMinLength) {
        return "Password must have minimum of 8 digit";
      }
    }
    return null;
  }

  String? validateDate(String? date) {
    if (date != null && date.isEmpty) {
      return 'Date field cannot be empty';
    }
    return null;
  }

  String? validatePin(String? pin) {
    if (pin != null) {
      if (pin.isEmpty) {
        return 'Pin field cannot be empty';
      }
      bool hasDigits = pin.contains(RegExp(r'[0-9]'));
      // bool hasLowercase = pin.contains(RegExp(r'[a-z]'));
      bool hasMinLength = pin.length >= 5;
      if (hasDigits & hasMinLength) return null;
    }
    return 'Please enter a valid pin';
  }

  String? validateTransactionPin(String? password) {
    if (password != null) {
      if (password.isEmpty) {
        return 'Pin field cannot be empty';
      }
      bool hasMinLength = password.length >= 6;
      if (hasMinLength) return null;
    }
    return 'Please enter a valid pin';
  }
}
