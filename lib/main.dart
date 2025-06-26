import 'package:flutter/material.dart';

void main() {
  runApp(F1App());
}

class F1App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F1 2025 Schedule',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red[800],
        scaffoldBackgroundColor: Color(0xFFe10600), // F1 Red
        fontFamily: 'RobotoCondensed', // Built-in cool font
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            textStyle: TextStyle(
              fontSize: 18,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: F1HomePage(),
    );
  }
}

class F1HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('F1 2025'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // F1 Logo
          Image.asset(
            'assets/images/f1_logo.png',
            width: 540,
            height: 270,
          ),
          SizedBox(height: 10),

          // The Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SchedulePage()),
                  );
                },
                child: Text('View 2025 Schedule'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SchedulePage extends StatelessWidget {
  final List<Map<String, String>> races = [
    {'name': 'Australian Grand Prix', 'date': 'March 16, 2025'},
    {'name': 'Saudi Arabian Grand Prix', 'date': 'March 23, 2025'},
    {'name': 'Japanese Grand Prix', 'date': 'April 6, 2025'},
    {'name': 'Chinese Grand Prix', 'date': 'April 20, 2025'},
    {'name': 'Miami Grand Prix', 'date': 'May 4, 2025'},
    {'name': 'Monaco Grand Prix', 'date': 'May 25, 2025'},
    {'name': 'British Grand Prix', 'date': 'July 6, 2025'},
    {'name': 'Belgian Grand Prix', 'date': 'August 3, 2025'},
    {'name': 'Italian Grand Prix', 'date': 'September 7, 2025'},
    {'name': 'Singapore Grand Prix', 'date': 'September 21, 2025'},
    {'name': 'Las Vegas Grand Prix', 'date': 'November 15, 2025'},
    {'name': 'Abu Dhabi Grand Prix', 'date': 'December 7, 2025'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2025 F1 Schedule'),
      ),
      body: ListView.builder(
        itemCount: races.length,
        itemBuilder: (context, index) {
          final race = races[index];
          return ListTile(
            leading: Icon(Icons.flag, color: Colors.white),
            title: Text(race['name']!),
            subtitle: Text(race['date']!),
          );
        },
      ),
    );
  }
}
