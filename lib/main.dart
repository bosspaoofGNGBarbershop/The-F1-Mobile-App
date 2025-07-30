import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main() => runApp(F1App());

class F1App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F1 2025 Schedule',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red[800],
        scaffoldBackgroundColor: Color(0xFFe10600),
        fontFamily: 'RobotoCondensed',
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
        ),
      ),
      home: MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    F1HomePage(),
    SchedulePage(),
    AboutPage(),
  ];

  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playBackgroundMusic();
  }

  void _playBackgroundMusic() async {
    await _audioPlayer.setSource(AssetSource('audio/f1theme.mp3'));
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.resume();

  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Dispose the player when done
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.white70,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
    );
  }
}

class F1HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey("Home"),
//      appBar: AppBar(title: Text('F1 2025')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/f1_logo.png',
            width: 540,
            height: 270,
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 300),
                      pageBuilder: (_, __, ___) => SchedulePage(),
                      transitionsBuilder: (_, anim, __, child) {
                        return FadeTransition(opacity: anim, child: child);
                      },
                    ),
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

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final List<Map<String, String>> races = [
    {'name': 'Australian GP', 'date': 'March 16, 2025', 'flag': 'australia.png', 'track': 'australian_gp.png'},
    {'name': 'Chinese GP', 'date': 'March 23, 2025', 'flag': 'china.png', 'track': 'china_gp.png'},
    {'name': 'Japanese GP', 'date': 'April 6, 2025', 'flag': 'japan.png', 'track': 'japan_gp.png'},
    {'name': 'Bahrain GP', 'date': 'April 13, 2025', 'flag': 'bahrain.png', 'track': 'bahrain_gp.png'},
    {'name': 'Saudi Arabian GP', 'date': 'April 20, 2025', 'flag': 'saudi_arabia.png', 'track': 'saudi_gp.png'},
    {'name': 'Miami GP', 'date': 'May 4, 2025', 'flag': 'usa.png', 'track': 'miami_gp.png'},
    {'name': 'Emilia‑Romagna GP', 'date': 'May 18, 2025', 'flag': 'italy.png', 'track': 'imola_gp.png'},
    {'name': 'Monaco GP', 'date': 'May 25, 2025', 'flag': 'monaco.png', 'track': 'monaco_gp.png'},
    {'name': 'Spanish GP', 'date': 'June 1, 2025', 'flag': 'spain.png', 'track': 'spain_gp.png'},
    {'name': 'Canadian GP', 'date': 'June 15, 2025', 'flag': 'canada.png', 'track': 'canada_gp.png'},
    {'name': 'Austrian GP', 'date': 'June 29, 2025', 'flag': 'austria.png', 'track': 'austria_gp.png'},
    {'name': 'British GP', 'date': 'July 6, 2025', 'flag': 'uk.png', 'track': 'british_gp.png'},
    {'name': 'Belgian GP', 'date': 'July 27, 2025', 'flag': 'belgium.png', 'track': 'belgian_gp.png'},
    {'name': 'Hungarian GP', 'date': 'August 3, 2025', 'flag': 'hungary.png', 'track': 'hungary_gp.png'},
    {'name': 'Dutch GP', 'date': 'August 31, 2025', 'flag': 'netherlands.png', 'track': 'dutch_gp.png'},
    {'name': 'Italian GP', 'date': 'September 7, 2025', 'flag': 'italy.png', 'track': 'italian_gp.png'},
    {'name': 'Azerbaijan GP', 'date': 'September 21, 2025', 'flag': 'azerbaijan.png', 'track': 'azerbaijan_gp.png'},
    {'name': 'Singapore GP', 'date': 'October 5, 2025', 'flag': 'singapore.png', 'track': 'singapore_gp.png'},
    {'name': 'United States GP', 'date': 'October 19, 2025', 'flag': 'usa.png', 'track': 'usa_gp.png'},
    {'name': 'Mexican GP', 'date': 'October 26, 2025', 'flag': 'mexico.png', 'track': 'mexico_gp.png'},
    {'name': 'Brazilian GP', 'date': 'November 9, 2025', 'flag': 'brazil.png', 'track': 'brazil_gp.png'},
    {'name': 'Las Vegas GP', 'date': 'November 23, 2025', 'flag': 'usa.png', 'track': 'vegas_gp.png'},
    {'name': 'Qatar GP', 'date': 'November 30, 2025', 'flag': 'qatar.png', 'track': 'qatar_gp.png'},
    {'name': 'Abu Dhabi GP', 'date': 'December 7, 2025', 'flag': 'uae.png', 'track': 'abudhabi_gp.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey("Schedule"),
      appBar: AppBar(title: Text('2025 F1 Schedule')),
      body: ListView.builder(
        itemCount: races.length,
        itemBuilder: (context, index) {
          final race = races[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.white,
            child: ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Image.asset(
                  'assets/images/flags/${race['flag']}',
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                race['name']!,
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              children: [
                ListTile(
                  title: Text(
                    "Date: ${race['date']}",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Image.asset(
                    'assets/images/tracks/${race['track']}',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey("About"),
      appBar: AppBar(title: Text('About')),
      body: Center(
        child: Text(
          'F1 2025 Schedule App\nCreated by Jolo',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
