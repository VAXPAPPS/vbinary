/// Helper service for converting between number systems
class NumberConverterService {
  /// Convert from any system to decimal
  static int toDecimal(String input, int fromBase) {
    input = input.trim().toUpperCase();
    int result = 0;

    for (int i = 0; i < input.length; i++) {
      String char = input[input.length - 1 - i];
      int value = _charToValue(char);

      if (value >= fromBase) {
        throw Exception('Invalid number for the selected system');
      }

      result += value * _pow(fromBase, i);
    }

    return result;
  }

  /// Convert from decimal to any system
  static String fromDecimal(int decimal, int toBase) {
    if (decimal == 0) return '0';

    String result = '';
    while (decimal > 0) {
      int remainder = decimal % toBase;
      result = _valueToChar(remainder) + result;
      decimal = decimal ~/ toBase;
    }

    return result;
  }

  /// Convert character to numeric value
  static int _charToValue(String char) {
    if (char.compareTo('0') >= 0 && char.compareTo('9') <= 0) {
      return int.parse(char);
    }
    return char.codeUnitAt(0) - 'A'.codeUnitAt(0) + 10;
  }

  /// Convert numeric value to character
  static String _valueToChar(int value) {
    if (value < 10) {
      return value.toString();
    }
    return String.fromCharCode('A'.codeUnitAt(0) + value - 10);
  }

  /// Calculate power (base ^ exponent)
  static int _pow(int base, int exponent) {
    int result = 1;
    for (int i = 0; i < exponent; i++) {
      result *= base;
    }
    return result;
  }
}
