import 'package:intl/intl.dart';
import '../../core/values/app_values.dart';
import '../enums/sortType.dart';

class DateSort {
  // there are three type of sort
  DateTime? _date; // sort by date
  String? _month; // sort by month
  int? _year; // sort by year

  DateSort.fromDate({required date}) {
    _date = date;
    _year = null;
    _month = null;
  }

  DateSort.fromMonth({required month}) {
    _month = month;
    _date = null;
    _year = null;
  }

  DateSort.fromYear({required year}) {
    _year = year;
    _date = null;
    _month = null;
  }

  dynamic getValue() {
    if (_date != null) return _date;
    if (_month != null) return _month;
    return _year;
  }

  SortType get type {
    if (_date != null) return SortType.Date;
    if (_month != null) return SortType.Month;
    return SortType.Year;
  }

  @override
  String toString() {
    String dateString;
    if (type == SortType.Date) {
      dateString =
          DateFormat(FormatValue.numbericDateFormat).format(getValue());
    } else {
      dateString = getValue().toString();
    }
    return dateString;
  }
}
