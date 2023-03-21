import 'package:get/get.dart';
import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  /// get num of date between dateFrom to DateTo
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  String get fommatDateTZ {
    String formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(this);
    return formattedDate;
  }

  /// get string day before
  String get dayBeforeString {
    int days = daysBetween(this, DateTime.now());
    if (days == 0) return "Today".tr;
    if (days == 1) return "Yesterday".tr;
    if (days <= 30) return "$days ${"days ago".tr}";
    if (days > 30) {
      if (days ~/ 30 == 1) return "1 month ago".tr;
      if (days ~/ 30 > 1 && days <= 365) {
        return "${days ~/ 30} ${"months ago".tr}";
      }
    }
    if (days > 365) {
      if (days ~/ 365 == 1) return "1 year ago".tr;
      return "${days ~/ 365} ${"years ago".tr}";
    }
    return "$days ${"days ago".tr}";
  }

  /// get the first, second, third, fourth and fifth week of the month
  int get getWeekOfDateInMonth {
    return day % 7 + 1;
  }
}
