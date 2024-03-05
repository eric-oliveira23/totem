String moneyFormat(double price, {bool withCurrencySymbol = true}) {
  String formattedPrice = price.toStringAsFixed(2);

  if (withCurrencySymbol) {
    formattedPrice = '\$$formattedPrice';
  }

  return formattedPrice;
}
