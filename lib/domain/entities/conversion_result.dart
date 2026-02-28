import 'package:equatable/equatable.dart';

class ConversionResult extends Equatable {
  final String input;
  final String fromBase;
  final String toBase;
  final String result;

  const ConversionResult({
    required this.input,
    required this.fromBase,
    required this.toBase,
    required this.result,
  });

  @override
  List<Object?> get props => [input, fromBase, toBase, result];
}
