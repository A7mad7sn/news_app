import "package:flutter/material.dart";
import 'package:flutter_app/constants/strings.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, mainScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            Expanded(
                child: Center(
              child: Image.asset("assets/logo.png"),
            )),
            const CircularProgressIndicator(),
            const SizedBox(
              height: 50,
            ),
            const Text("Developed by Ahmed Hassan")
          ],
        ),
      ),
    );
  }
}
