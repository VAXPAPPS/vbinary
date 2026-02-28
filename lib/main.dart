import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vbinary/core/colors/vaxp_colors.dart';
import 'package:window_manager/window_manager.dart';
import 'core/theme/vaxp_theme.dart';
import 'package:venom_config/venom_config.dart';
import 'package:vbinary/application/blocs/number_conversion_bloc.dart';
import 'package:vbinary/data/repositories/number_repository_impl.dart';
import 'package:vbinary/domain/usecases/number_usecases.dart';
import 'package:vbinary/presentation/screens/converter_screen.dart';

Future<void> main() async {
  // Initialize Flutter bindings first to ensure the binary messenger is ready
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Venom Config System
  await VenomConfig().init();

  // Initialize VaxpColors listeners
  VaxpColors.init();

  // Initialize window manager for desktop controls
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(405, 700), 
    center: true,
    titleBarStyle: TitleBarStyle.hidden,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const VaxpApp());
}

class VaxpApp extends StatelessWidget {
  const VaxpApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Create Repository, UseCases and BLoC
    final repository = NumberRepositoryImpl();
    final convertNumberUseCase = ConvertNumberUseCase(repository);
    final validateInputUseCase = ValidateInputUseCase(repository);
    final getSupportedBasesUseCase = GetSupportedBasesUseCase(repository);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: VaxpTheme.dark,
      home: BlocProvider(
        create: (context) => NumberConversionBloc(
          convertNumberUseCase: convertNumberUseCase,
          validateInputUseCase: validateInputUseCase,
          getSupportedBasesUseCase: getSupportedBasesUseCase,
        ),
        child: const ConverterScreen(),
      ),
    );
  }
}

