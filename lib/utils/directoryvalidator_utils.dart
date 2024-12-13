class DirectoryValidatorUtils {
  /// Returns a valid filename by removing prohibited characters from the input directory string.
  ///
  /// The prohibited characters are: <, >, :, ", /, \, |, ?, and *.
  ///
  /// [dir] is the input directory string that needs validation.
  ///
  /// Returns a string with the prohibited characters removed.
  static String getValidFilename({required String dir}) {
    String validDirectory = dir.replaceAll(RegExp(r'[<>:"/\\|?*]'), '');
    return validDirectory;
  }
}
