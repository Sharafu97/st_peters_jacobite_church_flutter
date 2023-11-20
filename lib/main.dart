import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/routes.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/theme/palette.dart';
import 'package:st_peters_jacobite_church_flutter/theme/text_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SPJSC BAHRAIN',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.beigeD7CFC5,
        primarySwatch: Palette.kToDark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Palette.kToDark,
          background: AppColors.beigeD7CFC5,
        ),
        textTheme: textTheme,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
    );
  }
}
