import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Center(
          child: Stack(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add your onPressed code here
                },
                child: Text('Click me'),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Text(
                  'Olá mundo',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
