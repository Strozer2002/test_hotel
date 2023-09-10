import 'package:easy_localization/easy_localization.dart';

class Utils {
  // bool phoneValidate(String? phone) {
  //   if (phone == null) return false;
  //   return RegExp(r'^\+7 \([0-9]{3}\) [0-9]{3}-[0-9]{4}$').hasMatch(phone);
  // }

  String formatNumber(int number) {
    String formatted = number.toString();
    List<String> result = [];

    for (int i = formatted.length - 1, j = 0; i >= 0; i--, j++) {
      if (j != 0 && j % 3 == 0) {
        result.add(' ');
      }
      result.add(formatted[i]);
    }

    return result.reversed.join('');
  }

  String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Введите номер телефона';
    } else if (!RegExp(r'^\+\d{1,2}\s\(\d{3}\)\s\d{3}-\d{2}-\d{2}$')
        .hasMatch(value)) {
      return 'Введите корректный номер телефона';
    } else {
      return null;
    }
  }

  String? validateMail(String value) {
    if (value.isEmpty) {
      return 'Пожалуйста, введите email';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
      return 'Пожалуйста, введите корректный email';
    }
    return null;
  }

  String? checkTextField(String value) {
    if (value.isEmpty) {
      return 'Поле пустое';
    } else {
      return null;
    }
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(":");
  }

  String intToClock(int seconds) {
    int minutesValue = seconds ~/ 60;
    int secondsValue = seconds % 60;

    String minutesString = minutesValue.toString().padLeft(2, '0');
    String secondsString = secondsValue.toString().padLeft(2, '0');

    return '$minutesString:$secondsString';
  }

  // Email validate
  bool emailValidate(String? email) {
    if (email == null) return false;
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }

  String sanitizePhoneNumber(String phone) {
    return phone
        .trim()
        .replaceAll(' ', '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll('-', '');
  }

  // Future<String?> parsePhone(String phone, {bool national = true}) async {
  //   phone = sanitizePhoneNumber(phone);
  //   if (phone.startsWith('+')) {
  //     phone = phone.substring(1);
  //   }
  //   if (phone.length == 11 && phone.startsWith('8')) {
  //     phone = phone.replaceFirst('8', '7');
  //   }
  //   if (phone.length == 10) {
  //     phone = '7$phone';
  //   }
  //   phone = '+$phone';
  //   try {
  //     final isValid = await PhoneNumberUtil().validate(phone);
  //     if (isValid) {
  //       final parsedPhone = await PhoneNumberUtil().parse(phone);
  //       if (national) {
  //         String national = parsedPhone.national;
  //         if (national.startsWith('8 ')) {
  //           national = national.replaceFirst('8 ', '');
  //         }
  //         return national;
  //       }
  //       return parsedPhone.international;
  //     }
  //   } catch (e) {
  //     // Invalid number
  //   }
  //   return null;
  // }
}

DateTime? dateTimeFromJson(String? date) {
  if (date == null) return null;
  date = date.replaceAll(RegExp(r'[^0-9]'), '');
  final dateInt = int.tryParse(date) ?? 0;
  return DateTime.fromMillisecondsSinceEpoch(dateInt);
}

/// 30.09.2020 00:00:00
String? dateTimeToJson(DateTime? date) {
  if (date == null) return null;
  return DateFormat('d.MM.y HH:mm:ss', 'ru').format(date);
}

/// 30 сентября 2020
String? dateTimeToFullMonth(DateTime? date) {
  if (date == null) return null;
  return DateFormat('d MMMM y', 'ru').format(date);
}

double? doubleFromString(String? val) {
  return double.tryParse(val ?? '');
}

String? doubleToString(double? val) {
  if (val == null) return null;
  return val.toString();
}

int? intFromString(String? val) {
  return int.tryParse(val ?? '');
}

String? intToString(int? val) {
  if (val == null) return null;
  return val.toString();
}
