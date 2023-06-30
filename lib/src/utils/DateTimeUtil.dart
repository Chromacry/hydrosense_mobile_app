class DateTimeUtil {
  static String getCurrentDateTime() => //* Get current DateTime
      DateTime.now()
          .toString()
          .substring(0, 19); //* Substring to remove milliseconds
}
