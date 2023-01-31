import 'dart:collection';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import '../../core/languages/en_US.dart';
import '../../core/languages/vi_VN.dart';

class LocalizationService extends Translations {
  // locale sẽ được get mỗi khi mới mở app (phụ thuộc vào locale hệ thống hoặc bạn có thể cache lại locale mà người dùng đã setting và set nó ở đây)
  static final locale = _getLocaleFromLanguage();

  // fallbackLocale là locale default nếu locale được set không nằm trong những Locale support
  static const fallbackLocale = Locale('en', 'US');

  // language code của những locale được support
  static final languageCodes = [
    'en',
    'vi',
  ];

  // các Locale được support
  static final locales = [
    const Locale('en', 'US'),
    const Locale('vi', 'VN'),
  ];

  // cái này là Map các language được support đi kèm với mã code của lang đó: cái này dùng để đổ data vào Dropdownbutton và set language mà không cần quan tâm tới language của hệ thống
  static final langs = LinkedHashMap.from({
    'en': 'English',
    'vi': 'Tiếng Việt',
  });

  // function change language nếu bạn không muốn phụ thuộc vào ngôn ngữ hệ thống
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
