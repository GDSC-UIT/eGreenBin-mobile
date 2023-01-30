extension DateTimeX on DateTime {
  /// get num of date between dateFrom to DateTo
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  /// get string day before
  String get dayBeforeString {
    if (daysBetween(this, DateTime.now()) == 0) return "Hôm nay";
    return "${daysBetween(this, DateTime.now())} ngày trước";
  }
}
