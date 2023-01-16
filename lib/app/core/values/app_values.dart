import 'package:egreenbin/app/core/values/app_strings.dart';

class AppValue {
  static const delayTime = Duration(milliseconds: 500);
  static DateTime minDateTime = DateTime.utc(-271821, 04, 20);
  static DateTime maxDateTime = DateTime.utc(275760, 09, 13);
}

class FormatValue {
  static const fullDateFormat = 'dd MMMM, yyyy';
  static const monthReducedDateFormat = 'dd MMM, yyyy';
  static const numbericDateFormat = 'dd/MM/yyyy';
  static const onlyDateFormat = 'dd';
  static const dayFormat = 'EEEE';
  static const fullMonthFormat = 'MMMM, yyyy';
  static const shortMonthFormat = 'MM/yyyy';
  static const dayInMonthFormat = 'dd/MM';
  static const yearFormat = 'yyyy';
  static const monthNDayFormat = 'MMMM, yyyy, EEEE';
}

class EmailValue {
  static const url = "https://api.emailjs.com/api/v1.0/email/send";
  static const serviceId = 'service_q39m2z8';
  static const templateId = 'template_0xq4dbm';
  static const userId = 'tAaD5e22_Mz7ZuPSK';
  static const emailFrom = 'phanvanminh1234567890@gmail.com';
  static const authorName = AppStrings.appName;
  static const subject =
      '[${AppStrings.appName}] - YOUR CHILD\'S TRAINING RESULTS';
}
