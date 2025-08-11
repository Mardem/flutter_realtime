import 'package:flutter/material.dart';

class OnboardingPresentation extends StatelessWidget {
  const OnboardingPresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Realtime ⚡',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(40, 44, 52, 1),
      ),
    );
  }
}
