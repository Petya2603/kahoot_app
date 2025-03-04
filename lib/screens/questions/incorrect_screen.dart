import 'package:flutter/material.dart';

class IncorrectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Incorrect Answer'),
      ),
      body: Center(
        child: Text(
          'Sorry, your answer is incorrect.',
          style: TextStyle(fontSize: 24, color: Colors.red),
        ),
      ),
    );
  }
}
