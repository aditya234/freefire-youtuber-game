class Validators {
  String validateName(String value) {
    if (value.isEmpty) return 'Username is required.';
    final RegExp nameExp = RegExp(r'^[a-zA-Z\-0-9]+$');
    if (!nameExp.hasMatch(value.trim()))
      return ' Please enter only alphabetical characters.';
    return null;
  }

  String validateEmail(String value) {
    if (value.isEmpty) return ' Email is required.';
    final RegExp nameExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!nameExp.hasMatch(value.trim())) return ' Invalid email address';
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) return 'Please choose a password.';
    if (value.length < 8) return 'Password must contain atleast 8 characters.';
    return null;
  }

  String validatePhoneNumber(String value) {
    if (value.isEmpty) return 'Phone Number is required';
    if (value.length != 10) return 'Phone Number must consist 10 digits';

    final RegExp phoneExp = RegExp(r'[6-9]\d{9}');
    if (!phoneExp.hasMatch(value.trim()) && value.length == 10)
      return 'Invalid phone number';
    return null;
  }

  String validateDate(String value) {
    if (value.isEmpty) return 'Date is required.';
    final RegExp nameExp = RegExp(
        r'^([1-9]|1[012])[- /.]([1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$');
    if (!nameExp.hasMatch(value)) return 'Date format should be dd-mm-yyyy.';
    return null;
  }

  static bool validateStringifiedNumber(String stringNumber) {
    RegExp isStringifiedNumber = RegExp(r'^[0-9]+$');
    return isStringifiedNumber.hasMatch(stringNumber.trim());
  }
}
