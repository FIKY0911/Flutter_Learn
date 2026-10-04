class CurrencyFormatter {
  CurrencyFormatter._();

  /// Formats an integer to Indonesian Rupiah representation: Rp 22.000
  static String formatRupiah(int amount) {
    final String str = amount.toString();
    final StringBuffer buffer = StringBuffer();
    int count = 0;
    for (int i = str.length - 1; i >= 0; i--) {
      buffer.write(str[i]);
      count++;
      if (count % 3 == 0 && i != 0) {
        buffer.write('.');
      }
    }
    return 'Rp ${buffer.toString().split('').reversed.join('')}';
  }
}
