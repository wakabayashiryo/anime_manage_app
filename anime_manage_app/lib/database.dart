import 'programInformation.dart';
import 'package:intl/intl.dart';

class database{
  List<TitleInformation> titleInfo = [];

  String createDateFormat(now) {
    var formatter = DateFormat('yyyy/MM/dd/HH:mm');
    String formatted = formatter.format(now);
    return formatted;
  }

  void addListItem(String title,int totalEpd,int currentEpd,int season,int year,int newEpdDate)
  {
    final TitleInformation info = TitleInformation(
      title: title,
      totalEpisodes: totalEpd,
      watchedEpisode: currentEpd,
      season: season,
      year: year,
      newEpisodeDate: newEpdDate,
      updateDate: createDateFormat(DateTime.now())
    );
    final int lastIndex = titleInfo.length;

    titleInfo.insert(lastIndex, info);
  }

  void updateItem(int index,int currentEpd)
  {
    titleInfo[index]
      ..watchedEpisode = currentEpd
      ..updateDate = createDateFormat(DateTime.now());
  }

  void removeListItem(int index)
  {

  }
}

