import 'package:vbinary/domain/repositories/number_repository.dart';

class ConvertNumberUseCase {
  final NumberRepository repository;

  ConvertNumberUseCase(this.repository);

  Future<String> call({
    required String input,
    required String fromBase,
    required String toBase,
  }) async {
    return await repository.convertNumber(
      input: input,
      fromBase: fromBase,
      toBase: toBase,
    );
  }
}

class ValidateInputUseCase {
  final NumberRepository repository;

  ValidateInputUseCase(this.repository);

  bool call({
    required String input,
    required String base,
  }) {
    return repository.validateInput(input: input, base: base);
  }
}

class GetSupportedBasesUseCase {
  final NumberRepository repository;

  GetSupportedBasesUseCase(this.repository);

  List<String> call() {
    return repository.getSupportedBases();
  }
}
