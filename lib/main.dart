import 'package:flutter/material.dart';
import 'package:platform_converter/provider/change_theme_provider.dart';
import 'package:platform_converter/provider/image_picker.dart';
import 'package:platform_converter/provider/image_provider.dart';
import 'package:platform_converter/provider/provider.dart';
import 'package:platform_converter/provider/system_change_provider.dart';
import 'package:platform_converter/screens/android_screen.dart';
import 'package:provider/provider.dart';

import 'ios_screen/ios_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SystemChange(),
      ),
      ChangeNotifierProvider(
        create: (context) => ImagePickerProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => AddData(),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeChange(),
      ),
      ChangeNotifierProvider(
        create: (context) => ImgProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: Provider.of<ThemeChange>(context).isLight
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Provider.of<SystemChange>(context).isIos
          ? IosScreen()
          : AndroidScreen(),
    );
  }
}