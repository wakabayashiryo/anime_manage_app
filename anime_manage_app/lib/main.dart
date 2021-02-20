import 'package:flutter/material.dart';
import 'history.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime Manager(Beta)',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner :true,
      home: MyHomePage(title: 'Ani Mane(beta)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 2000;

  void _incrementCounter() {
    setState(() {
      if (_selectedIndex < 2)
        _selectedIndex = _selectedIndex + 1;
      else
        _selectedIndex = 0;
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Center(
        child: Text(
      'Home',
      textAlign: TextAlign.center,
      style: optionStyle,
    )),
    ViewdHistory(),
    Center(
        child: Text(
      'Setting Page',
      textAlign: TextAlign.center,
      style: optionStyle,
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.lightGreen,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.arrow_right),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
} /**/
