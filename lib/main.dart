import 'package:dars3/utils/app_constants.dart';
import 'package:dars3/views/screens/home_screen.dart';
import 'package:dars3/views/screens/pin_code_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void toggleThemeMode(bool value) {
    AppConstants.themeMode = value ? ThemeMode.dark : ThemeMode.light;
    setState(() {});
  }

  void backgroundImage(String imageUrl) {
    setState(
      () {
        if (imageUrl.trim().isNotEmpty) {
          AppConstants.images = imageUrl;
          setState(() {});
        }
      },
    );
  }

  void appBarColor(Color appBarStayle) {
    AppConstants.appBarColor = appBarStayle;
    setState(() {});
  }

  void fontSize(double textFontSize) {
    print(textFontSize);
    AppConstants.fontSize = textFontSize;
    setState(() {});
  }

  void textColor(Color textFontColor) {
    AppConstants.textColor = textFontColor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amber,
        ),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: AppConstants.themeMode,
      // home: const PinCodeScreen(),
      home: PinCodeScreen(
        onThemeChanged: toggleThemeMode,
        onBackgroundImageChanged: backgroundImage,
        onAppBarColorChanged: appBarColor,
        onTextFontSize: fontSize,
        onTextColor: textColor,
      ),
    );
  }
}
