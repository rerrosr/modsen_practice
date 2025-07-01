import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final VoidCallback onPressed;

  const ErrorScreen({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('An error occurred'),
          ElevatedButton(onPressed: onPressed, child: const Text('Retry')),
        ],
      ),
    );
  }
}
