import 'package:flutter/material.dart';
import 'package:vbinary/core/theme/vaxp_theme.dart';
import 'package:vbinary/core/colors/vaxp_colors.dart';

class ResultDisplay extends StatelessWidget {
  final String result;
  final String fromBase;
  final String toBase;
  final VoidCallback onCopy;

  const ResultDisplay({
    super.key,
    required this.result,
    required this.fromBase,
    required this.toBase,
    required this.onCopy,
  });

  @override
  Widget build(BuildContext context) {
    return VaxpGlass(
      blur: 15,
      opacity: 0.2,
      radius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Result',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white70,
                  ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  fromBase,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white60,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward, color: Colors.white60, size: 16),
                const SizedBox(width: 8),
                Text(
                  toBase,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white60,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: onCopy,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: VaxpColors.primary.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: VaxpColors.primary.withOpacity(0.6),
                  ),
                ),
                child: Text(
                  result,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Courier',
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Click to copy',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
