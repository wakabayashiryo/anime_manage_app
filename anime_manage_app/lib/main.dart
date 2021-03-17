import 'package:flutter/material.dart';
import 'screen/WatchList.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hoge',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: true,
      home: WatchList(),
// home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
