import 'package:flutter/material.dart';

class CorrectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Correct Answer'),
      ),
      body: Center(
        child: Text(
          'Congratulations! Your answer is correct.',
          style: TextStyle(fontSize: 24, color: Colors.green),
        ),
      ),
    );
  }
}
