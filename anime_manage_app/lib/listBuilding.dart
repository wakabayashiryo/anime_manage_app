import 'package:flutter/material.dart';
import 'programInformation.dart';

/*
TODO
 - Share TileCard widget with WatchList.dart
 - Sort lists by several patterns
 - from this list, can add watch list
 */

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return tileCard(context, index);
          }),
    );
  }
}

