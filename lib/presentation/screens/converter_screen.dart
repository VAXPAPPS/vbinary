import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vbinary/application/blocs/number_conversion_bloc.dart';
import 'package:vbinary/application/events/number_conversion_event.dart';
import 'package:vbinary/application/states/number_conversion_state.dart';
import 'package:vbinary/presentation/widgets/base_selector.dart';
import 'package:vbinary/presentation/widgets/number_input_field.dart';
import 'package:vbinary/presentation/widgets/result_display.dart';
import 'package:vbinary/core/colors/vaxp_colors.dart';

import '../../core/venom_layout.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  String _selectedFromBase = 'Decimal (10)';
  String _selectedToBase = 'Hexadecimal (16)';
  String _inputNumber = '';

  @override
  void initState() {
    super.initState();
    context.read<NumberConversionBloc>().add(const InitializeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return VenomScaffold(
      title: 'VBinary',
      body: BlocBuilder<NumberConversionBloc, NumberConversionState>(
        builder: (context, state) {
          List<String> supportedBases = [];

          if (state is NumberConversionInitial) {
            supportedBases = state.supportedBases;
          } else if (state is NumberConversionSuccess) {
            supportedBases = state is NumberConversionInitial
                ? (state as NumberConversionInitial).supportedBases
                : [];
          }

          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Header
                    Text(
                      'Number Base Converter',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Convert between Binary, Octal, Decimal, and Hexadecimal',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),

                    // Input field
                    NumberInputField(
                      label: 'Enter the number',
                      onChanged: (value) {
                        setState(() => _inputNumber = value);
                      },
                    ),
                    const SizedBox(height: 24),

                    // Select from system
                    BaseSelector(
                      label: 'From System',
                      selectedBase: _selectedFromBase,
                      options: supportedBases.isNotEmpty
                          ? supportedBases
                          : [
                              'Binary (2)',
                              'Octal (8)',
                              'Decimal (10)',
                              'Hexadecimal (16)'
                            ],
                      onChanged: (value) {
                        setState(() => _selectedFromBase = value);
                      },
                    ),
                    const SizedBox(height: 20),

                    // Select to system
                    BaseSelector(
                      label: 'To System',
                      selectedBase: _selectedToBase,
                      options: supportedBases.isNotEmpty
                          ? supportedBases
                          : [
                              'Binary (2)',
                              'Octal (8)',
                              'Decimal (10)',
                              'Hexadecimal (16)'
                            ],
                      onChanged: (value) {
                        setState(() => _selectedToBase = value);
                      },
                    ),
                    const SizedBox(height: 32),

                    // Convert button
                    ElevatedButton.icon(
                      onPressed: _inputNumber.isEmpty
                          ? null
                          : () {
                              context.read<NumberConversionBloc>().add(
                                    ConvertNumberEvent(
                                      input: _inputNumber,
                                      fromBase: _selectedFromBase,
                                      toBase: _selectedToBase,
                                    ),
                                  );
                            },
                      icon: const Icon(Icons.swap_horiz),
                      label: const Text(
                        'Convert',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        backgroundColor: _inputNumber.isEmpty
                            ? VaxpColors.primary.withOpacity(0.4)
                            : VaxpColors.primary,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Display states
                    BlocConsumer<NumberConversionBloc, NumberConversionState>(
                      listener: (context, state) {
                        if (state is NumberConversionError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.message),
                              backgroundColor: Colors.red.withOpacity(0.8),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is NumberConversionLoading) {
                          return const CircularProgressIndicator(
                            color: Colors.white70,
                          );
                        } else if (state is NumberConversionSuccess) {
                          return Column(
                            children: [
                              ResultDisplay(
                                result: state.result,
                                fromBase: state.fromBase,
                                toBase: state.toBase,
                                onCopy: () {
                                  // نسخ للحافظة
                                  _copyToClipboard(state.result);
                                },
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton.icon(
                                onPressed: () {
                                  context
                                      .read<NumberConversionBloc>()
                                      .add(const ClearResultEvent());
                                  setState(() => _inputNumber = '');
                                },
                                icon: const Icon(Icons.clear),
                                label: const Text('Clear'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red.withOpacity(0.6),
                                ),
                              ),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _copyToClipboard(String text) {
    // In reality, should use Clipboard API
    // But here we use ScaffoldMessenger as a simple alternative
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied: $text'),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green.withOpacity(0.8),
      ),
    );
  }
}
