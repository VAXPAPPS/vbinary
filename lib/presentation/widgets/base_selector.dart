import 'package:flutter/material.dart';
import 'package:vbinary/core/colors/vaxp_colors.dart';

class BaseSelector extends StatefulWidget {
  final String label;
  final String selectedBase;
  final List<String> options;
  final Function(String) onChanged;

  const BaseSelector({
    super.key,
    required this.label,
    required this.selectedBase,
    required this.options,
    required this.onChanged,
  });

  @override
  State<BaseSelector> createState() => _BaseSelectorState();
}

class _BaseSelectorState extends State<BaseSelector> {
  late String _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selectedBase;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            widget.label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white70,
            ),
          ),
        ),
        DropdownButton<String>(
          value: _selected,
          isExpanded: true,
          dropdownColor: const Color.fromARGB(200, 0, 0, 0),
          underline: Container(
            height: 1,
            color: VaxpColors.primary.withOpacity(0.3),
          ),
          items: widget.options.map((String base) {
            return DropdownMenuItem<String>(
              value: base,
              child: Text(
                base,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() => _selected = newValue);
              widget.onChanged(newValue);
            }
          },
        ),
      ],
    );
  }
}
