import 'package:intl/intl.dart';

class Validator {
  String? textValidatorAlphanumericWithSpacialCharacters(
      {String? value, required String msg}) {
    String p = r'^[ A-Za-z0-9-,\.(@/-_)&]*$';
    RegExp regExp = RegExp(p);
    bool validate = regExp.hasMatch(value ?? "");

    if (value == null || value.isEmpty) {
      return "$msg ${"AppEnglishTexts().cannot_be_blank"}";
    } else if (value[0] == " ") {
      return "$msg ${"AppEnglishTexts().cannot_be_blank"}";
    } else if (value.length < 3) {
      return "$msg ${"AppEnglishTexts().length_grater_than"}";
    } else if (!validate) {
      return "${"AppEnglishTexts().enter_valid_msg"} $msg .";
    } else {
      return null;
    }
  }

  String? ifscCodeValidation({String? value, required String msg}) {
    RegExp regExp = RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$');
    bool validate = regExp.hasMatch(value ?? "");
    if (value == null || value.isEmpty) {
      return "$msg ${"AppEnglishTexts().cannot_be_blank"}";
    } else if (value[0] == " ") {
      return "$msg ${"AppEnglishTexts().cannot_be_blank"}";
    } else if (value.length < 3) {
      return "$msg ${"AppEnglishTexts().length_grater_than"}";
    } else if (!validate) {
      return "${"AppEnglishTexts().enter_valid_msg"} $msg .";
    } else {
      return null;
    }
  }

  String? textValidatorLicense({String? value, required String msg}) {
    String p = r'^[ A-Za-z0-9,_;./-]*$';
    RegExp regExp = RegExp(p);
    bool validate = regExp.hasMatch(value ?? "");

    if (value == null || value.isEmpty) {
      return "$msg ${"AppEnglishTexts().cannot_be_blank"}";
    } else if (value[0] == " ") {
      return "$msg ${"AppEnglishTexts().cannot_be_blank"}";
    } else if (value.length < 3) {
      return "$msg ${"AppEnglishTexts().length_grater_than"}";
    } else if (!validate) {
      return "${"AppEnglishTexts().enter_valid_msg"} $msg .";
    } else {
      return null;
    }
  }

  String? textValidatorAlphanumeric({String? value, required String msg}) {
    String p = r'^[ A-Za-z0-9]*$';
    RegExp regExp = RegExp(p);
    bool validate = regExp.hasMatch(value ?? "");

    if (value == null || value.isEmpty) {
      return "$msg ${"AppEnglishTexts().cannot_be_blank"}";
    } else if (value[0] == " ") {
      return "$msg ${"AppEnglishTexts().cannot_be_blank"}";
    } else if (value.length < 3) {
      return "$msg ${"AppEnglishTexts().length_grater_than"}";
    } else if (!validate) {
      return "${"AppEnglishTexts().enter_valid_msg"} $msg .";
    } else {
      return null;
    }
  }

  String? onlyTextValidator({String? value, required String msg}) {
    String p = r'^[ A-Za-z]*$';
    RegExp regExp = RegExp(p);
    bool validate = regExp.hasMatch(value ?? "");

    if (value == null || value.isEmpty) {
      return "$msg ${"AppEnglishTexts().cannot_be_blank"}";
    } else if (value[0] == " ") {
      return "$msg ${"AppEnglishTexts().cannot_be_blank"}";
    } else if (value.length < 3) {
      return "$msg ${"AppEnglishTexts().length_grater_than"}";
    } else if (!validate) {
      return "${"AppEnglishTexts().enter_valid_msg"} $msg .";
    } else {
      return null;
    }
  }

  String? longTextValidator({String? value, required String msg}) {
    String p = r'^[ A-Za-z]*$';
    RegExp regExp = RegExp(p);
    bool validate = regExp.hasMatch(value ?? "");

    if (value == null || value.isEmpty) {
      return "$msg ${"AppEnglishTexts().cannot_be_blank"}";
    } else if (value[0] == " ") {
      return "$msg ${"AppEnglishTexts().cannot_be_blank"}";
    } else if (value.length < 20) {
      return "$msg ${"AppEnglishTexts().longText"}";
    } else if (!validate) {
      return "${"AppEnglishTexts().enter_valid_msg"} $msg .";
    } else {
      return null;
    }
  }

  String? pinCodeValidator({String? value}) {
    String p = r'^[1-9][0-9]{5}$';
    RegExp regExp = RegExp(p);

    bool validate = regExp.hasMatch(value ?? "");

    if (value == null || value.isEmpty) {
      return "${"AppEnglishTexts().busPincode"} ${"AppEnglishTexts().cannot_be_blank"}";
    } else if (value[0] == " ") {
      return "${"AppEnglishTexts().busPincode"} ${"AppEnglishTexts().cannot_be_blank"}";
    } else if (value.length != 6 || !validate) {
      return "${"AppEnglishTexts().enter_valid_msg"} ${"AppEnglishTexts().busPincode"} .";
    } else {
      return null;
    }
  }

  String? dobValidator({String? value}) {
    if (value == null || value.isEmpty) {
      return "AppEnglishTexts().dateTimeValidator2";
    } else if (value.length < 10) {
      return "AppEnglishTexts().dateTimeValidator";
    } else if (value.length == 10) {
      var date = DateTime.parse(
          "${value.trim().split("-").elementAt(2)}-${value.trim().split("-").elementAt(1)}-${value.trim().split("-").elementAt(0)}");
      if (DateFormat("dd-MM-yyyy").format(date) != value ||
          date.difference(DateTime.now()).inDays > 0) {
        return "AppEnglishTexts().dateTimeValidator";
      }
    }

    return null;
  }

  String? emailValidator({String? value}) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    bool validate = regExp.hasMatch(value ?? "");
    if (!validate) {
      return "LocalizationKeys.emailValidatorText.tr()";
    } else if (value![0] == " ") {
      return "LocalizationKeys.emailValidatorText.tr()";
    } else {
      return null;
    }
  }

  String? phoneNumberValidator({String? value}) {
    String p = r'^[0-9]*$';
    RegExp regExp = RegExp(p);
    bool validate = regExp.hasMatch(value ?? "");
    List<String> digits = ["1", '2', '3', '4'];

    if (value == null || value.isEmpty) {
      return "tr(LocalizationKeys.phoneValidationText)";
    } else if (value[0] == " ") {
      return "tr(LocalizationKeys.phoneValidationText)";
    } else if (digits.contains(value[0])) {
      return "tr(LocalizationKeys.phoneValidationText)";
    } else if (value.length != 10 || !validate) {
      return "tr(LocalizationKeys.phoneValidationText)";
    } else {
      return null;
    }
  }

  bool? isBeforeDate({required String startDate, required String endDate}) {
    if (startDate == "" || endDate == "") {
      return null;
    } else {
      return DateTime.parse(startDate).isBefore(DateTime.parse(endDate));
    }
  }

  String? panCardValidator({String? value}) {
    String p = "[A-Z]{5}[0-9]{4}[A-Z]{1}";
    RegExp regExp = RegExp(p);
    bool validate = regExp.hasMatch(value ?? "");

    if (value == null || value.isEmpty) {
      return ("Enter Valid PAN Number");
    } else if (value.length != 10 || !validate) {
      return ("Enter Valid PAN Number");
    } else {
      return null;
    }
  }

  String? validatePassword(String? password) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
    bool validate = regex.hasMatch(password ?? "");

    if (password == null || password.isEmpty) {
      return 'Please enter password';
    } else {
      if (!validate && password.contains(" ")) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  String? validatePasswordV2(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter a password';
    }
    if (password.contains(" ")) {
      return 'Password should not contain spaces';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[0-9!@#\$&*~]').hasMatch(password)) {
      return 'Password must contain at least one number or special character (!@#\$&*~)';
    }
    return null; // Valid password
  }

  String? validateEmptyField({String? value, required String msg}) {
    if (value == null || value.isEmpty) {
      return "$msg ${"AppEnglishTexts().cannot_be_blank"}";
    } else if (value[0] == " ") {
      return "$msg ${"AppEnglishTexts().cannot_be_blank"}";
    } else if (value.length < 3) {
      return "$msg ${"AppEnglishTexts().length_grater_than"}";
    } else {
      return null;
    }
  }
}
