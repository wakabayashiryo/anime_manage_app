import 'package:flutter/material.dart';

class WatchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Watch List'),
        ),
        body: ListView.builder(
            itemCount: 15, //Provisional Number
            itemBuilder: (BuildContext context, int index) {
              return tileCard(context,index);
            }));
  }
}

Widget tileCard(BuildContext context,int _index) {
  _index++;
  return ListTile(
    leading: Icon(Icons.video_label),
// This icon will set video on-demand Icon (netflix youtube amapra etc...)
    title: Text('Story of Monster by Nishio Ishin'),
//This Title of Story
    subtitle: Text('9 March 2021'),
//The Date that this title added at list
    trailing: Text('EP$_index '),
//Show Episode Number
    onTap: () {
      confirmingDialog(context);
    }, //decoy function

  );
}

Future<dynamic> confirmingDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Successful watching?'),
          actions: <Widget>[
            TextButton( //register
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel')),
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'))
          ],
        );
      });
}