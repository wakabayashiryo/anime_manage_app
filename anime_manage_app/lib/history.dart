import 'package:flutter/material.dart';
import 'title_list.dart';

class ViewdHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.white.withOpacity(0.3),
            unselectedLabelStyle: TextStyle(fontSize: 12.0),
            labelColor: Colors.white,
            labelStyle: TextStyle(fontSize: 16.0),
            indicatorColor: Colors.white,
            indicatorWeight: 2.0,
            tabs: [
              Tab(text: '2019'),
              Tab(text: '2020'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: spring2020.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${spring2020[index]}'),
                );
              },
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.directions_bike),
                  title: Text('EVANGELION 1.11'),
                ),
                ListTile(
                  leading: Icon(Icons.directions_bike),
                  title: Text('EVANGELION 2.22'),
                ),
                ListTile(
                  leading: Icon(Icons.directions_bike),
                  title: Text('EVANGELION 3.33'),
                ),
                ListTile(
                  leading: Icon(Icons.directions_bike),
                  title: Text('EVANGELION 3.0 + 1.0'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
