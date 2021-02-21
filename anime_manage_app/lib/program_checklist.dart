import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProgramChecklists extends StatefulWidget {
  @override
  _ProgramChecklistsState createState() => _ProgramChecklistsState();
}

class _ProgramChecklistsState extends State<ProgramChecklists> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 3,
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            // backgroundColor: Colors.gree,
            title: TabBar(
              dragStartBehavior: DragStartBehavior.down,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2.5,
              indicatorPadding: EdgeInsets.all(1),
              isScrollable: true,
              labelColor: Colors.white,
              labelPadding: EdgeInsets.all(10),
              labelStyle: TextStyle(fontSize: 20.0),
              unselectedLabelColor: Colors.white,
              unselectedLabelStyle: TextStyle(fontSize: 14.0),

              tabs: [
                Text(('日曜日')),
                Text(('月曜日')),
                Text(('火曜日')),
                Text(('水曜日')),
                Text(('木曜日')),
                Text(('金曜日')),
                Text(('土曜日')),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CheckboxListTile(
                  title: Text('test'),
                  secondary: Icon(Icons.beach_access),
                  onChanged: null,
                  value: true,
              ),
              CheckboxListTile(
                title: Text('test'),
                secondary: Icon(Icons.beach_access),
                onChanged: null,
                value: true,
              ),
              CheckboxListTile(
                title: Text('test'),
                secondary: Icon(Icons.beach_access),
                onChanged: null,
                value: true,
              ),
              CheckboxListTile(
                title: Text('test'),
                secondary: Icon(Icons.beach_access),
                onChanged: null,
                value: true,
              ),
              CheckboxListTile(
                title: Text('test'),
                secondary: Icon(Icons.beach_access),
                onChanged: null,
                value: true,
              ),
              CheckboxListTile(
                title: Text('test'),
                secondary: Icon(Icons.beach_access),
                onChanged: null,
                value: true,
              ),
              CheckboxListTile(
                title: Text('test'),
                secondary: Icon(Icons.beach_access),
                onChanged: null,
                value: true,
              ),
            ],
          ),
        )
    );
  }
}

