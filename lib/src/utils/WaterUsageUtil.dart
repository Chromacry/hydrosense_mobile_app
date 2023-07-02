class WaterUsageUtil {
  static double getWaterUsage({
    required String flowRate,
    required String timeUsed,
  }) {
    //* Convert mins to hour
    return (double.parse(flowRate) * 60) * (double.parse(timeUsed) / 60);
  }

  static double getEstimatedCost({
    required String tariffRate,
    required double waterUsage,
  }) {
    //* convert tariffrate from cubic metre to litre and add waterbourne fee of 4.5
    return ((double.parse(tariffRate) / 1000) * waterUsage) + 4.5;
  }
}
