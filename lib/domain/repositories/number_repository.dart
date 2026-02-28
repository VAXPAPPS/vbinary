abstract class NumberRepository {
  /// تحويل من نظام إلى آخر
  Future<String> convertNumber({
    required String input,
    required String fromBase,
    required String toBase,
  });

  /// التحقق من صحة الإدخال
  bool validateInput({
    required String input,
    required String base,
  });

  /// الحصول على الأنظمة المدعومة
  List<String> getSupportedBases();
}
