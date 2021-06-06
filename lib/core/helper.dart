import '../import.dart';

class Helper {
  String? mandatoryTextValidator(String? text) {
    if (text!.isEmpty) return t_required;
    return null;
  }

  String? mandatoryPhoneNumber(String? text) {
    String p = r'((\(\d{3}\) ?)|(\d{3}))\d{0,10}';
    RegExp regExp = RegExp(p);
    if (text!.isEmpty)
      return t_required;
    else if (!regExp.hasMatch(text) || text.length != 10)
      return msg_invalid_phone;
  }

  String? mandatoryPin(String? text) {
    String p = r'((\(\d{3}\) ?)|(\d{3}))\d{0,10}';
    RegExp regExp = RegExp(p);
    if (text!.isEmpty)
      return t_required;
    else if (!regExp.hasMatch(text) || text.length != 4) return t_incorrect_pin;
  }

  String? mandatoryTextValidatorName(String? text) {
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (text!.isEmpty) return t_required;
    if (!nameExp.hasMatch(text)) return msg_title_validation_alphabetic;
  }

  String? isValidEmail(String? text) {
    if (text!.trim().isEmpty)
      return t_required;
    else {
      if (!text.isEmail) {
        return msg_invalid_mail;
      }
    }
  }

  String? mandatoryDate(String? value) {
    if (value!.isEmpty) return t_required;
    if (value.length != 10) return msg_invalid_date;
  }
}

final helper = Helper();
