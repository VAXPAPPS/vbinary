import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vbinary/application/events/number_conversion_event.dart';
import 'package:vbinary/application/states/number_conversion_state.dart';
import 'package:vbinary/domain/usecases/number_usecases.dart';

class NumberConversionBloc
    extends Bloc<NumberConversionEvent, NumberConversionState> {
  final ConvertNumberUseCase convertNumberUseCase;
  final ValidateInputUseCase validateInputUseCase;
  final GetSupportedBasesUseCase getSupportedBasesUseCase;

  NumberConversionBloc({
    required this.convertNumberUseCase,
    required this.validateInputUseCase,
    required this.getSupportedBasesUseCase,
  }) : super(NumberConversionInitial(supportedBases: [])) {
    on<InitializeEvent>(_onInitialize);
    on<ConvertNumberEvent>(_onConvertNumber);
    on<ValidateInputEvent>(_onValidateInput);
    on<ClearResultEvent>(_onClearResult);
  }

  Future<void> _onInitialize(
    InitializeEvent event,
    Emitter<NumberConversionState> emit,
  ) async {
    try {
      final bases = getSupportedBasesUseCase();
      emit(NumberConversionInitial(supportedBases: bases));
    } catch (e) {
      emit(NumberConversionError(message: 'Initialization error: ${e.toString()}'));
    }
  }

  Future<void> _onConvertNumber(
    ConvertNumberEvent event,
    Emitter<NumberConversionState> emit,
  ) async {
    emit(const NumberConversionLoading());

    try {
      // Validate input first
      bool isValid = validateInputUseCase(
        input: event.input,
        base: event.fromBase,
      );

      if (!isValid) {
        emit(
          NumberConversionError(
            message: 'Invalid number for the system: ${event.fromBase}',
          ),
        );
        return;
      }

      // Perform conversion
      final result = await convertNumberUseCase(
        input: event.input,
        fromBase: event.fromBase,
        toBase: event.toBase,
      );

      emit(NumberConversionSuccess(
        result: result,
        input: event.input,
        fromBase: event.fromBase,
        toBase: event.toBase,
      ));
    } catch (e) {
      emit(NumberConversionError(message: e.toString()));
    }
  }

  Future<void> _onValidateInput(
    ValidateInputEvent event,
    Emitter<NumberConversionState> emit,
  ) async {
    try {
      final isValid = validateInputUseCase(
        input: event.input,
        base: event.base,
      );

      emit(InputValidationState(
        isValid: isValid,
        input: event.input,
        base: event.base,
      ));
    } catch (e) {
      emit(NumberConversionError(message: e.toString()));
    }
  }

  Future<void> _onClearResult(
    ClearResultEvent event,
    Emitter<NumberConversionState> emit,
  ) async {
    final bases = getSupportedBasesUseCase();
    emit(NumberConversionInitial(supportedBases: bases));
  }
}
