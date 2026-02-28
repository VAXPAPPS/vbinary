import 'package:flutter/material.dart';
import 'package:vbinary/core/colors/vaxp_colors.dart';

class NumberInputField extends StatefulWidget {
  final String label;
  final Function(String) onChanged;
  final String? Function(String?)? validator;

  const NumberInputField({
    super.key,
    required this.label,
    required this.onChanged,
    this.validator,
  });

  @override
  State<NumberInputField> createState() => _NumberInputFieldState();
}

class _NumberInputFieldState extends State<NumberInputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(color: Colors.white70),
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
        filled: true,
        fillColor: const Color.fromARGB(100, 32, 32, 32),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: VaxpColors.primary.withOpacity(0.3),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: VaxpColors.primary.withOpacity(0.2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: VaxpColors.primary,
          ),
        ),
      ),
    );
  }
}
