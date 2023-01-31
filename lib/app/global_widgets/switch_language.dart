import "package:egreenbin/app/core/theme/app_colors.dart";
import "package:egreenbin/app/data/services/localization_service.dart";
import "package:flutter/material.dart";
import "package:flutter_switch/flutter_switch.dart";

class SwitchLanguage extends StatefulWidget {
  const SwitchLanguage({super.key});

  @override
  State<SwitchLanguage> createState() => _SwitchLanguageState();
}

class _SwitchLanguageState extends State<SwitchLanguage> {
  bool status = (LocalizationService.locale != const Locale('en', 'US'));

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
        width: 55.0,
        height: 27.0,
        valueFontSize: 13.0,
        activeText: "VN",
        activeTextColor: AppColors.normal,
        inactiveText: "EN",
        inactiveTextColor: AppColors.primarySubtle2,
        activeToggleColor: AppColors.normal,
        inactiveToggleColor: AppColors.primarySubtle2,
        activeColor: AppColors.primarySubtle2,
        inactiveColor: AppColors.subtle_2,
        showOnOff: true,
        value: status,
        onToggle: (value) {
          setState(() {
            status = value;
            if (value) {
              LocalizationService.changeLocale('vi');
            } else {
              LocalizationService.changeLocale('en');
            }
          });
        });
  }
}
