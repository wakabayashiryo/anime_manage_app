import 'package:flutter/material.dart';
import 'dart:developer';
import 'history.dart';
import 'favorites.dart';
import 'weekly_schedule.dart';
import 'setting.dart';
import 'database.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Map<String, Widget> _pagesList = {
    'schedule': Schedule(),
    'favorites': Favorites(),
    'history': ViewdHistory(),
    'Setting': Setting()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Anime Manager(Beta)',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: true,
        home: MyHomePage(pages: _pagesList));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.pages}) : super(key: key);

  final Map<String, Widget> pages;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _showPage;
  List<String> _pageKeyList = [];

  @override
  void initState() {
    test();
    // TODO: implement initState
    _showPage = widget.pages['schedule'];
    for (var key in widget.pages.keys) _pageKeyList.add(key);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime Manager(Beta)'),
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
            Container(
                height: double.maxFinite,
                // height: MediaQuery.of(context).size.height * 0.25,
                padding: EdgeInsets.all(5),
                child: ListView.builder(
                    itemCount: _pageKeyList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text('${_pageKeyList[index]}'),
                        onTap: () {
                          _pageListTapped('${_pageKeyList[index]}');
                        },
                      );
                    })),
          ],
        ),
      ),
      body: _showPage,

      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
      //     BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.amber,
      //   onTap: _onItemTapped,
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.arrow_right),
      // ),
    );
  }

  void _pageListTapped(String index) {
    setState(() {
      Navigator.pop(context);
      _showPage = widget.pages[index];
    });
  }
} /**/
