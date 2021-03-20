
import 'package:anime_manage_app/history.dart';
import 'package:flutter/material.dart';

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
      home: ViewedHistory(),
// home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}