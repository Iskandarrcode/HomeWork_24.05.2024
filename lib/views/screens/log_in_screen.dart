import 'package:dars3/utils/app_constants.dart';
import 'package:dars3/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LoginScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<Color> onAppBarColorChanged;
  final ValueChanged<double> onTextFontSize;
  final ValueChanged<Color> onTextColor;

  const LoginScreen({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
    required this.onAppBarColorChanged,
    required this.onTextFontSize,
    required this.onTextColor,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final textPinCodeController1 = TextEditingController();
  String errorMessagePinCode1 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(201, 43, 46, 78),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            const SizedBox(height: 30),
            TextField(
              controller: textPinCodeController1,
              // obscureText: true,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(84),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                fillColor: const Color(0xffF1F1FE),
                filled: true,
                errorStyle: const TextStyle(color: Colors.red),
                label: const Text(
                  "PIN CODE",
                  style: TextStyle(fontSize: 14),
                ),
                errorText:
                    errorMessagePinCode1.isEmpty ? null : errorMessagePinCode1,
              ),
            ),
            const SizedBox(height: 50),
            ZoomTapAnimation(
              onTap: () {
                if (textPinCodeController1.text != AppConstants.password) {
                  setState(() {
                    errorMessagePinCode1 = "Pin Code Xato !";
                    textPinCodeController1.clear();
                  });
                } else {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen(
                        onThemeChanged: widget.onThemeChanged,
                        onBackgroundImageChanged:
                            widget.onBackgroundImageChanged,
                        onAppBarColorChanged: widget.onAppBarColorChanged,
                        onTextFontSize: widget.onTextFontSize,
                        onTextColor: widget.onTextColor,
                      );
                    },
                  ));
                }
                setState(() {});
              },
              child: Container(
                width: 110,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: const Color.fromARGB(171, 22, 41, 108),
                ),
                child: const Center(
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
