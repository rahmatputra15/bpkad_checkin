class WorkTimeService {
  static bool isWorkingTime() {
    final now = DateTime.now();

    if (now.weekday == DateTime.saturday || now.weekday == DateTime.sunday) {
      return false;
    }

    final start = DateTime(now.year, now.month, now.day, 7, 30);
    final end = DateTime(now.year, now.month, now.day, 16, 0);

    return now.isAfter(start) && now.isBefore(end);
  }
}
