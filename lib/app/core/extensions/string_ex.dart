extension StringX on String {
  /// Viết hoa chữ cái đầu
  String capitalize() {
    if (length > 0) {
      return '${this[0].toUpperCase()}${substring(1)}';
    }

    return this;
  }

  /// Parse string sang double (trả về default value thay vì throw lỗi)
  double parseDouble([double defaultValue = 0.0]) {
    return double.tryParse(replaceAll(RegExp(r'[^0-9\.]'), '')) ?? defaultValue;
  }

  /// check string is number
  bool isNumeric() {
    if (this == "") {
      return false;
    }
    return double.tryParse(this) != null;
  }

  /// get index of month string (ex: january -> 1)
  /// if index == -1 => false
  int get indexMonth {
    int index = -1;
    switch (this) {
      case 'January':
        index = 1;
        break;
      case 'February':
        index = 2;
        break;
      case 'March':
        index = 3;
        break;
      case 'April':
        index = 4;
        break;
      case 'May':
        index = 5;
        break;
      case 'June':
        index = 6;
        break;
      case 'July':
        index = 7;
        break;
      case 'August':
        index = 8;
        break;
      case 'September':
        index = 9;
        break;
      case 'October':
        index = 10;
        break;
      case 'November':
        index = 11;
        break;
      case 'December':
        index = 12;
        break;
      default:
        index = -1;
        break;
    }
    return index;
  }
}
