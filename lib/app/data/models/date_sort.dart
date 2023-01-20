import 'package:intl/intl.dart';

import '../../core/values/app_values.dart';

enum SortType {
  Date,
  Week,
  Month,
}

class DateSort {
  DateTime? _date;
  String? _week;
  String? _month;

  DateSort.fromDate({required date}) {
    this._date = date;
    _week = null;
    _month = null;
  }

  DateSort.fromWeek({required week}) {
    this._week = week;
    _date = null;
    _month = null;
  }
  DateSort.fromMonth({required month}) {
    this._month = month;
    _date = null;
    _week = null;
  }

  dynamic getValue() {
    if (_date != null) return _date;
    if (_week != null) return _week;
    return _month;
  }

  SortType get type {
    if (_date != null) return SortType.Date;
    if (_week != null) return SortType.Week;
    return SortType.Month;
  }

  @override
  String toString() {
    String dateString;
    if (type == SortType.Date) {
      dateString =
          DateFormat(FormatValue.numbericDateFormat).format(getValue());
    } else {
      dateString = getValue();
    }
    return dateString;
  }
}
