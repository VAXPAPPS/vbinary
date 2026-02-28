import 'package:equatable/equatable.dart';

abstract class NumberConversionState extends Equatable {
  const NumberConversionState();

  @override
  List<Object?> get props => [];
}

class NumberConversionInitial extends NumberConversionState {
  final List<String> supportedBases;

  const NumberConversionInitial({required this.supportedBases});

  @override
  List<Object?> get props => [supportedBases];
}

class NumberConversionLoading extends NumberConversionState {
  const NumberConversionLoading();
}

class NumberConversionSuccess extends NumberConversionState {
  final String result;
  final String input;
  final String fromBase;
  final String toBase;

  const NumberConversionSuccess({
    required this.result,
    required this.input,
    required this.fromBase,
    required this.toBase,
  });

  @override
  List<Object?> get props => [result, input, fromBase, toBase];
}

class NumberConversionError extends NumberConversionState {
  final String message;

  const NumberConversionError({required this.message});

  @override
  List<Object?> get props => [message];
}

class InputValidationState extends NumberConversionState {
  final bool isValid;
  final String input;
  final String base;

  const InputValidationState({
    required this.isValid,
    required this.input,
    required this.base,
  });

  @override
  List<Object?> get props => [isValid, input, base];
}
