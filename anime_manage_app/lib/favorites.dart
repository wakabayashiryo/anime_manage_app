import 'package:flutter/material.dart';

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

Widget tileCard(BuildContext context, int _index) {
  _index++;
  return ListTile(
      leading: Icon(Icons.picture_in_picture),
      // This icon mean that thumbnail will put here
      title: Text('Story of Monster by Nishio Ishin'),
      //This Title of Story
      subtitle: Text('Spring 2021'),
      //The Air Date
      trailing: Icon(Icons.favorite),
      //favorite icon
      onTap: () {}
      );
} //decoy func
