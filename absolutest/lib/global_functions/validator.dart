import 'package:absolutest/global_widgets/pj_text_form_field.dart';

bool validation(String text, TextFieldType type) {
  if (text.isEmpty){
    return false;
  }
  if (type == TextFieldType.PASSWORD) {
    RegExp regEx = RegExp(r"(?=.*[A-Z])(?=.*[a-z])(?=.*?[0-9])\w+");
    return regEx.hasMatch(text) && text.length >= 8;
  }
  if (type == TextFieldType.EMAIL){
    RegExp regEx =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regEx.hasMatch(text);
  }
  return true;
}

List<String> passwordValidation(String text) {
  List<String> list = [];
  if (text.length < 8) {
    list.add('Пароль должен содержать минимум 8 символов');
    if (text.isEmpty) {
      return list;
    }
  }
  RegExp regEx = RegExp(r"(?=.*[A-Z])\w+");
  if (!regEx.hasMatch(text)) {
    list.add('Пароль должен содержать заглавные буквы');
  }
  regEx = RegExp(r"(?=.*[a-z])\w+");
  if (!regEx.hasMatch(text)) {
    list.add('Пароль должен содержать строчные буквы');
  }
  regEx = RegExp(r"(?=.*?[0-9])\w+");
  if (!regEx.hasMatch(text)) {
    list.add('Пароль должен содержать цифры');
  }
  return list;
}

List<String> passwordRepeatValidation(String password, String newPassword) {
  List<String> list = [];
  if (password != newPassword && password.isNotEmpty) {
    list.add('Пароли не совпадают');
  }
  return list;
}

List<String> emailValidation(String email) {
  List<String> list = [];
  RegExp regEx =
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (!regEx.hasMatch(email)) {
    list.add('Некорректный Email-адрес');
  }
  return list;
}
