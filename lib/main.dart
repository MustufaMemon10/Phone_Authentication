import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_auth_assignment/core/utils/custom_theme/elevated_button_theme.dart';
import 'package:phone_auth_assignment/screens/language_screen.dart';

import 'firebase_options.dart';

void main() async{
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Phone Auth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        elevatedButtonTheme: SElevatedButtonTheme.lightElevatedButton,
      ),
      home: const LanguageScreen()
    );
  }
}
