import 'package:intl/intl.dart';

class CurrencyFormatUtils {
  /// Format a double value to a string representing currency
  ///
  /// If [withCurrency] is true, the output will be prefixed with 'IDR '.
  /// If [value] is 0 or 0.0, the output will be 'IDR 0' or '0' depending on
  /// [withCurrency].
  ///
  /// If [value] is not 0 or 0.0, the output will be a string formatted using
  /// [NumberFormat] with the pattern '#,###,000'. The output will have a decimal
  /// separator of '.'.
  ///
  String formatCurrency(double value, {bool withCurrency = true}) {
    NumberFormat formatter = NumberFormat('#,###,000');

    if (withCurrency) {
      if (value == 0 || value == 0.0) {
        return 'IDR 0';
      }
      if (value.toString().split('.').first.length < 3) {
        return 'IDR ${value.toString().split('.').first}';
      }
      return 'IDR ${formatter.format(value).replaceAll(',', '.')}';
    }
    if (value == 0 || value == 0.0) {
      return '0';
    }

    return formatter.format(value).replaceAll(',', '.');
  }

  /// Parse a string formatted as currency to an integer.
  ///
  /// The string should be in the format returned by [formatCurrency].
  ///
  /// If [value] is 'IDR 0', the output will be 0.
  /// Otherwise, the 'IDR ' prefix and '.' decimal separator will be removed,
  /// and the remaining string will be parsed as an integer.
  int bringBackToint(String value) {
    return int.parse(value.replaceAll('IDR ', '').replaceAll('.', ''));
  }
}
