import 'package:flutter/material.dart';
import 'dart:async';
import 'title_list.dart';

class ViewedHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.calendar_today_outlined),
            onPressed: () => selectYears(context),
          ),
          centerTitle: true,
          title: _ShowYearCard(2019),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 10),
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => selectYears(context),
                ))
          ],
          bottom: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.white.withOpacity(0.3),
            unselectedLabelStyle: TextStyle(fontSize: 12.0),
            labelColor: Colors.white,
            labelStyle: TextStyle(fontSize: 16.0),
            indicatorColor: Colors.white,
            indicatorWeight: 2.0,
            tabs: [
              Tab(text: 'Spring'),
              Tab(text: 'Summer'),
              Tab(text: 'Autumn'),
              Tab(text: 'Winter'),
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
            ListView(),
            ListView()
          ],
        ),
      ),
    );
  }
}

Future<void> selectYears(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Select Year"),
        content: Container(
          // Need to use container to add size constraint.
          width: 300,
          height: 300,
          child: YearPicker(
            firstDate: DateTime(1995),
            lastDate: DateTime.now(),
            initialDate: DateTime.now(),
            // save the selected date to _selectedDate DateTime variable.
            // It's used to set the previous selected date when
            // re-showing the dialog.
            selectedDate: DateTime(DateTime.now().year),
            onChanged: (DateTime dateTime) {
              // close the dialog when year is selected.
              Navigator.pop(context);

              // Do something with the dateTime selected.
              // Remember that you need to use dateTime.year to get the year
            },
          ),
        ),
      );
    },
  );
}

class _ShowYearCard extends StatelessWidget {
  final int _year;

  _ShowYearCard(this._year);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        child: Card(
          color: Colors.green,
          shadowColor: Colors.lightGreen,
          child: Text(
            '${this._year}',
            style: TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
