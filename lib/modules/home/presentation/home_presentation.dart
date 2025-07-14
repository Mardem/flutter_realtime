import 'package:flutter/material.dart';

class HomePresentation extends StatelessWidget {
  const HomePresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Home presentation')],
        ),
      ),
    );
  }
}
