class CentsParser {
  static double centsToDollars(int cents) {
    return cents / 100.0;
  }

  static int dollarsToCents(double dollars) {
    return (dollars * 100).round();
  }
}
