import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/git/myloader.gif',
          width: 100,  // Adjust size as needed
          height: 100,
        ),
      ),
    );
  }
}
