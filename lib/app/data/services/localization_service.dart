import 'dart:collection';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import '../../core/languages/en_US.dart';
import '../../core/languages/vi_VN.dart';

class LocalizationService extends Translations {
  static final locale = _getLocaleFromLanguage();

  static const fallbackLocale = Locale('en', 'US');

  static final languageCodes = [
    'en',
    'vi',
  ];

// các Locale được support
  static final locales = [
    const Locale('en', 'US'),
    const Locale('vi', 'VN'),
  ];

  static final langs = LinkedHashMap.from({
    'en': 'English',
    'vi': 'Tiếng Việt',
  });

  static void changeLocale(String languageCode) {
    final locale = _getLocaleFromLanguage(languageCode: languageCode);
    Get.updateLocale(locale);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enLanguagePackage,
        'vi_VN': viLanguagePackage,
      };

  static Locale _getLocaleFromLanguage({String? languageCode}) {
    var lang = languageCode ?? Get.deviceLocale!.languageCode;
    for (int i = 0; i < languageCodes.length; i++) {
      if (lang == languageCodes[i]) return locales[i];
    }
    return Get.locale!;
  }

  // ignore: body_might_complete_normally_nullable
  Future<String?> getLanguague() async {
    // var storage = AppSettingStorage();
    // String value = await storage.readAppConfig();
    // if (value != "") {
    //   var json = jsonDecode(value);
    //   var defaultLanguage = json['default_language'];
    //   return defaultLanguage;
    // }
  }
}
