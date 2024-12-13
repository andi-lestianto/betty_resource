import 'package:intl/intl.dart';

class DateTimeUtils {
  /// Get current date in string format 'dd MMMM yyyy'
  ///
  /// [languageCode] is the locale of the date format
  ///
  /// Returns the current date in string format 'dd MMMM yyyy' with the given locale
  String getDateNow({required String languageCode}) {
    final f = DateFormat('dd MMMM yyyy', languageCode);
    final dateNow = f.format(DateTime.now());

    return dateNow.toString();
  }

  /// Get current time in string format 'HH:mm'
  ///
  /// [languageCode] is the locale of the time format
  ///
  /// Returns the current time in string format 'HH:mm' with the given locale
  String getTimeNow({required String languageCode}) {
    final f = DateFormat('HH:mm', languageCode);
    final timeNow = f.format(DateTime.now());

    return timeNow.toString();
  }

  /// Get current date in string format 'EEE, dd MMMM yyyy'
  ///
  /// [languageCode] is the locale of the date format
  ///
  /// Returns the current date with the day of the week in string format 'EEE, dd MMMM yyyy' with the given locale
  String getDateNowWithDay({required String languageCode}) {
    final f = DateFormat('EEE, dd MMMM yyyy', languageCode);
    final dateNow = f.format(DateTime.now());

    return dateNow.toString();
  }

  /// Format a given [date] to a string in the format 'dd MMM yyyy'.
  ///
  /// [languageCode] is the locale of the date format.
  ///
  /// Returns a formatted date string according to the given locale.`
  String formatDate({required DateTime date, required String languageCode}) {
    final f = DateFormat('dd MMM yyyy', languageCode);
    final result = f.format(date);

    return result.toString();
  }

  /// Format a given [date] to a string in the format 'dd MMM yyyy HH:mm'.
  ///
  /// [languageCode] is the locale of the date and time format.
  ///
  /// Returns a formatted date and time string according to the given locale.
  String formatDateWithTime(
      {required DateTime date, required String languageCode}) {
    final f = DateFormat('dd MMM yyyy HH:mm', languageCode);
    final result = f.format(date);

    return result.toString();
  }

  /// Format a given [date] to a string in the format 'EEE, dd MMMM yyyy'.
  ///
  /// [languageCode] is the locale of the date format.
  ///
  /// Returns a formatted date string with the day of the week according to the given locale.
  String formatDateWithDay(
      {required DateTime date, required String languageCode}) {
    final f = DateFormat('EEE, dd MMMM yyyy', languageCode);
    final result = f.format(date);

    return result.toString();
  }

  /// Format a given [date] to a string in the format 'HH:mm'.
  ///
  /// [languageCode] is the locale of the time format.
  ///
  /// Returns a formatted time string according to the given locale.
  String formatTime({required DateTime date, required String languageCode}) {
    final f = DateFormat('HH:mm', languageCode);
    final result = f.format(date.toLocal());

    return result.toString();
  }

  /// Format a given [date] to a string in the format 'EEEE'.
  ///
  /// [languageCode] is the locale of the day format.
  ///
  /// Returns a formatted day string according to the given locale.
  String getNameOfDay({required DateTime date, required String languageCode}) {
    final f = DateFormat('EEEE', languageCode);
    final result = f.format(date);

    return result.toString();
  }
}
