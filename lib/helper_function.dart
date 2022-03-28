bool validatePhoneNumber(String value) {
    // String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    String pattern = r"(^\\+[0-9]{2}|^\\+[0-9]{2}\\(0\\)|^\\(\\+[0-9]{2}\\)\\(0\\)|^00[0-9]{2}|^0)([0-9]{9}$|[0-9\\-\\s]{10}$)";
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
          return false;
    }
    else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
}

// String capitalizeName(String name ) {
//   final names = name.split(" ");
//   if (names.length >1 ){

//   }else {
    
//   }
// }