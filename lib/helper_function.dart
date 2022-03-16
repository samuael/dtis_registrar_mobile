bool validatePhoneNumber(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
          return false;
    }
    else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
} 