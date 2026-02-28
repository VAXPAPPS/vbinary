import 'package:vbinary/domain/repositories/number_repository.dart';

class NumberRepositoryImpl extends NumberRepository {
  @override
  Future<String> convertNumber({
    required String input,
    required String fromBase,
    required String toBase,
  }) async {
    try {
      // Convert to decimal (10) first
      int decimal = _toDecimal(input, _baseToInt(fromBase));

      // Convert from decimal to the required system
      String result = _fromDecimal(decimal, _baseToInt(toBase), toBase);

      return result;
    } catch (e) {
      throw Exception('Conversion error: ${e.toString()}');
    }
  }

  @override
  bool validateInput({
    required String input,
    required String base,
  }) {
    input = input.trim().toUpperCase();
    if (input.isEmpty) return false;

    int baseInt = _baseToInt(base);

    for (String char in input.split('')) {
      int value = _charToValue(char);
      if (value >= baseInt) {
        return false;
      }
    }
    return true;
  }

  @override
  List<String> getSupportedBases() {
    return ['Binary (2)', 'Octal (8)', 'Decimal (10)', 'Hexadecimal (16)'];
  }

  /// Convert from any system to decimal
  int _toDecimal(String input, int fromBase) {
    input = input.trim().toUpperCase();
    int result = 0;

    for (int i = 0; i < input.length; i++) {
      String char = input[input.length - 1 - i];
      int value = _charToValue(char);

      if (value >= fromBase) {
        throw Exception('Invalid number for the selected system');
      }

      result += value * (fromBase ~/ 1).pow(i);
    }

    return result;
  }

  /// Convert from decimal to any system
  String _fromDecimal(int decimal, int toBase, String baseLabel) {
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
  int _charToValue(String char) {
    if (char.compareTo('0') >= 0 && char.compareTo('9') <= 0) {
      return int.parse(char);
    }
    return char.codeUnitAt(0) - 'A'.codeUnitAt(0) + 10;
  }

  /// Convert numeric value to character
  String _valueToChar(int value) {
    if (value < 10) {
      return value.toString();
    }
    return String.fromCharCode('A'.codeUnitAt(0) + value - 10);
  }

  /// Convert system name to number
  int _baseToInt(String base) {
    if (base.contains('2')) return 2;
    if (base.contains('8')) return 8;
    if (base.contains('10')) return 10;
    if (base.contains('16')) return 16;
    throw Exception('Unsupported system');
  }
}

extension on int {
  int pow(int exponent) {
    int result = 1;
    for (int i = 0; i < exponent; i++) {
      result *= this;
    }
    return result;
  }
}
