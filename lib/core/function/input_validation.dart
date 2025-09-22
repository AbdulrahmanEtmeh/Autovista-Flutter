import 'package:get/get.dart';

inputValidation(String value, int min, int max, String type) {
  if (type == 'username') {
    if (!GetUtils.isUsername(value)) {
      return 'Not valid username';
    }
  }

  if (type == 'email') {
    if (!GetUtils.isEmail(value)) {
      return 'Not valid email';
    }
  }

  if (value.isEmpty) {
    return "This field can't be empty";
  }

  if (value.length < min) {
    return "This field length can't be less than $min characters";
  }

  if (value.length > max) {
    return "This field lenght can't be more than $max characters";
  }
}
