import 'package:anime_manage_app/database_helper.dart';
import 'package:flutter/material.dart';

class ProgramInformation {
  int? id;
  String? title;
  int? weekDays;
  List<bool>? progress = [];

  @override
  String toString() {
    return '{ ${this.id} ${this.title}, ${this.weekDays}, ${this.progress} }';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'weekDays': weekDays,
      'progress': '$progress' //Convert String Data for sqflite
    };
  }

  /*
    "[true,false,true,false....]" <= String type
     to
    [true,false,true,false....] <= List type
   */
  List<bool>? fromBoolString2List(String? text) {
    List<bool> result = [];
    final String hoge = text!.substring(1, text.length - 1);
    final List<String> hoge2 = hoge.split(",");

    hoge2.forEach((element) {
      element == 'true' ? result.add(true) : result.add(false);
    });

    return result;
  }

  // Extract a Note object from a Map object
  ProgramInformation.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.title = map['title'];
    this.weekDays = map['weekDays'];
    this.progress = fromBoolString2List(map['progress']);
  }

  ProgramInformation(
      {this.id, this.title, this.weekDays, this.progress});
}

class ProgramInfoModel with ChangeNotifier {
  List<ProgramInformation> _listData = [];
  final dbHelper = DatabaseHelper.helperInstance;

  //initialize seedData
  ProgramInfoModel() {
    refreshData();
    _listData.add(ProgramInformation(
        title: '文豪ストレイドッグス　わん！',
        weekDays: DateTime.sunday,
        progress: [false]));
    _listData.add(ProgramInformation(
        title: 'けいおん！！',
        weekDays: DateTime.sunday,
        progress: [false]));
    _listData.add(ProgramInformation(
        title: 'OBSOLETE',
        weekDays: DateTime.sunday,
        progress: [false]));
    _listData.add(ProgramInformation(
        title: 'のんのんびより　のんすとっぷ',
        weekDays: DateTime.sunday,
        progress: [false]));
    _listData.add(ProgramInformation(
        title: 'おそ松さん',
        weekDays: DateTime.sunday,
        progress: [false]));
  }

  List<ProgramInformation> get listData => _listData;

  void refreshData() async {
    // _listData = await dbHelper.getDBlist();
  }

  void createTitle(ProgramInformation data) {
    dbHelper.insert(data);
    refreshData();
    notifyListeners();
  }

  void deleteTitle(int index) {
    dbHelper.delete(index);
    refreshData();
    notifyListeners();
  }

  void updateTitle(ProgramInformation data) {
    dbHelper.update(data);
    refreshData();
    notifyListeners();
  }

  void toggleProgress(ProgramInformation data, int progindex) {
    data.progress?[progindex] = !data.progress![progindex];
    if(data.progress?[data.progress!.length-1]==true){
      data.progress?.add(false);
    }

    refreshData();
    notifyListeners();
  }

  List<ProgramInformation>? searchByWeekday(int? weekday) {
    return _listData.where((element) => element.weekDays == weekday).toList();
  }
}

// //Sunday
// _listData.add(ProgramInformation(
//     title: '文豪ストレイドッグス　わん！',
//     weekDays: DateTime.sunday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: 'けいおん！！',
//     weekDays: DateTime.sunday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: 'OBSOLETE',
//     weekDays: DateTime.sunday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: 'のんのんびより　のんすとっぷ',
//     weekDays: DateTime.sunday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: 'おそ松さん',
//     weekDays: DateTime.sunday,
//     totalEpisode: 12,
//     progress: [false]));

// //Monday
// _listData.add(ProgramInformation(
//     title: '進撃の巨人 The Final Season',
//     weekDays: DateTime.monday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: '7SEED',
//     weekDays: DateTime.monday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: 'SHIROBAKO',
//     weekDays: DateTime.monday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: 'シュタインズゲート',
//     weekDays: DateTime.monday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: 'ウマ娘　プリティーダービー　Season 2',
//     weekDays: DateTime.monday,
//     totalEpisode: 12,
//     progress: [false]));

// //tuesday
// _listData.add(ProgramInformation(
//     title: '裏世界ピクニック',
//     weekDays: DateTime.tuesday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: 'はたらく細胞!!',
//     weekDays: DateTime.tuesday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: 'はたらく細胞BLACK',
//     weekDays: DateTime.tuesday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: 'ワールドウィッチーズ発進しますっ!',
//     weekDays: DateTime.tuesday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: 'ワンダーエッグ・プライオリティ',
//     weekDays: DateTime.tuesday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: 'Re:ゼロから始めるい世界生活 第2期',
//     weekDays: DateTime.tuesday,
//     totalEpisode: 12,
//     progress: [false]));

// //Wednesday
// _listData.add(ProgramInformation(
//     title: '七つの大罪憤怒の審判',
//     weekDays: DateTime.wednesday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: 'ゆるキャン△ SEASON2',
//     weekDays: DateTime.wednesday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: '約束のネバーランド Season2',
//     weekDays: DateTime.wednesday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: '弱キャラ友崎くん',
//     weekDays: DateTime.wednesday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: 'アズールレーン　びそくぜんしんっ!',
//     weekDays: DateTime.wednesday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: '転生したらスライムだった件　第２期　第１部',
//     weekDays: DateTime.wednesday,
//     totalEpisode: 12,
//     progress: [false]));

// //Thursday
// _listData.add(ProgramInformation(
//     title: 'BEASTARS 第２期',
//     weekDays: DateTime.thursday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: 'ホリミヤ',
//     weekDays: DateTime.thursday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: '宇宙よりも遠い場所',
//     weekDays: DateTime.thursday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: '八十亀ちゃんかんさつにっき　３さつめ',
//     weekDays: DateTime.thursday,
//     totalEpisode: 12,
//     progress: [false]));

// //Friday
// _listData.add(ProgramInformation(
//     title: '五等分の花嫁ff',
//     weekDays: DateTime.friday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: '天地創造デザイン部',
//     weekDays: DateTime.friday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: 'ゲキドル',
//     weekDays: DateTime.friday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: 'ガンゲイル・オンライン',
//     weekDays: DateTime.friday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: 'ガウリール・ドロップアウト',
//     weekDays: DateTime.friday,
//     totalEpisode: 12,
//     progress: [false]));

// //Saturday
// _listData.add(ProgramInformation(
//     title: '無職転生　〜異世界行ったら本気だす〜',
//     weekDays: DateTime.saturday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: 'きんいろもざいく',
//     weekDays: DateTime.saturday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: '呪術廻戦',
//     weekDays: DateTime.saturday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: '<物語>シリーズ　セカンドシーズン',
//     weekDays: DateTime.saturday,
//     totalEpisode: 12,
//     progress: [false]));
// _listData.add(ProgramInformation(
//     title: '蜘蛛ですが、なにか?',
//     weekDays: DateTime.saturday,
//     totalEpisode: 12,
//     progress: [false]));
