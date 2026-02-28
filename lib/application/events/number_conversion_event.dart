import 'package:equatable/equatable.dart';

abstract class NumberConversionEvent extends Equatable {
  const NumberConversionEvent();

  @override
  List<Object?> get props => [];
}

class InitializeEvent extends NumberConversionEvent {
  const InitializeEvent();
}

class ConvertNumberEvent extends NumberConversionEvent {
  final String input;
  final String fromBase;
  final String toBase;

  const ConvertNumberEvent({
    required this.input,
    required this.fromBase,
    required this.toBase,
  });

  @override
  List<Object?> get props => [input, fromBase, toBase];
}

class ValidateInputEvent extends NumberConversionEvent {
  final String input;
  final String base;

  const ValidateInputEvent({
    required this.input,
    required this.base,
  });

  @override
  List<Object?> get props => [input, base];
}

class ClearResultEvent extends NumberConversionEvent {
  const ClearResultEvent();
}
