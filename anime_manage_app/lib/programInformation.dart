import 'package:flutter/material.dart';

class TitleInformation {

  static const int spring = 1;
  static const int summer = 2;
  static const int autumn = 3;
  static const int winter = 4;

  String title;
  int _id;
  int totalEpisodes;
  int watchedEpisode;
  int progress;
  // String thumbnail;

  int year;
  int season;
  int newEpisodeDate;

  String updateDate;

  String serviceName;
  String movieURL;
  Widget iconTheme;

  TitleInformation({
    this.title,
    this.totalEpisodes,
    this.watchedEpisode,
    this.season,
    this.year,
    this.newEpisodeDate,
    this.updateDate
  });

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

Widget TaskListView(BuildContext context, int _index)
{

  return null;
}
