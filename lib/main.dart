import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('The F1 Mobile App'),
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              width: 300, // adjust as needed
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Name:',
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        'John Creus',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Age:',
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        '24 years old',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Gender:',
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        'Male',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
