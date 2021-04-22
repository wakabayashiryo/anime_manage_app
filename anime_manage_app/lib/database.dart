import 'package:flutter/material.dart';

class ProgramInformation {
  String? title;
  int? totalEpisode;
  int? weekDays;
  List<bool>? progress;

  @override
  String toString() {
    return '{ ${this.title}, ${this.weekDays}, ${this.totalEpisode}, ${this.progress} }';
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'totalEpisode': totalEpisode,
      'weekDays': weekDays,
      'progress': '$progress' //Convert String Data for sqflite
    };
  }

  ProgramInformation(
      {this.title, this.weekDays, this.totalEpisode, this.progress});
}

class ProgramInfoModel with ChangeNotifier {
  List<ProgramInformation> _seedData = [];

  //initialize seedData
  ProgramInfoModel() {
    //Sunday
    _seedData.add(ProgramInformation(
        title: '文豪ストレイドッグス　わん！',
        weekDays: DateTime.sunday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: 'けいおん！！',
        weekDays: DateTime.sunday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: 'OBSOLETE',
        weekDays: DateTime.sunday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: 'のんのんびより　のんすとっぷ',
        weekDays: DateTime.sunday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: 'おそ松さん',
        weekDays: DateTime.sunday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));

    //Monday
    _seedData.add(ProgramInformation(
        title: '進撃の巨人 The Final Season',
        weekDays: DateTime.monday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: '7SEED',
        weekDays: DateTime.monday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: 'SHIROBAKO',
        weekDays: DateTime.monday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: 'シュタインズゲート',
        weekDays: DateTime.monday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: 'ウマ娘　プリティーダービー　Season 2',
        weekDays: DateTime.monday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));

    //tuesday
    _seedData.add(ProgramInformation(
        title: '裏世界ピクニック',
        weekDays: DateTime.tuesday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: 'はたらく細胞!!',
        weekDays: DateTime.tuesday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: 'はたらく細胞BLACK',
        weekDays: DateTime.tuesday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: 'ワールドウィッチーズ発進しますっ!',
        weekDays: DateTime.tuesday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: 'ワンダーエッグ・プライオリティ',
        weekDays: DateTime.tuesday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: 'Re:ゼロから始めるい世界生活 第2期',
        weekDays: DateTime.tuesday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));

    //Wednesday
    _seedData.add(ProgramInformation(
        title: '七つの大罪憤怒の審判',
        weekDays: DateTime.wednesday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: 'ゆるキャン△ SEASON2',
        weekDays: DateTime.wednesday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: '約束のネバーランド Season2',
        weekDays: DateTime.wednesday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: '弱キャラ友崎くん',
        weekDays: DateTime.wednesday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: 'アズールレーン　びそくぜんしんっ!',
        weekDays: DateTime.wednesday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: '転生したらスライムだった件　第２期　第１部',
        weekDays: DateTime.wednesday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));

    //Thursday
    _seedData.add(ProgramInformation(
        title: 'BEASTARS 第２期',
        weekDays: DateTime.thursday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: 'ホリミヤ',
        weekDays: DateTime.thursday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: '宇宙よりも遠い場所',
        weekDays: DateTime.thursday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: '八十亀ちゃんかんさつにっき　３さつめ',
        weekDays: DateTime.thursday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));

    //Friday
    _seedData.add(ProgramInformation(
        title: '五等分の花嫁ff',
        weekDays: DateTime.friday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: '天地創造デザイン部',
        weekDays: DateTime.friday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: 'ゲキドル',
        weekDays: DateTime.friday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: 'ガンゲイル・オンライン',
        weekDays: DateTime.friday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: 'ガウリール・ドロップアウト',
        weekDays: DateTime.friday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));

    //Saturday
    _seedData.add(ProgramInformation(
        title: '無職転生　〜異世界行ったら本気だす〜',
        weekDays: DateTime.saturday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: 'きんいろもざいく',
        weekDays: DateTime.saturday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: '呪術廻戦',
        weekDays: DateTime.saturday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: '<物語>シリーズ　セカンドシーズン',
        weekDays: DateTime.saturday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));
    _seedData.add(ProgramInformation(
        title: '蜘蛛ですが、なにか?',
        weekDays: DateTime.saturday,
        totalEpisode: 12,
        progress: List<bool>.filled(12, false)));

  }

  List<ProgramInformation> get seedData => _seedData;

  void addTitle(ProgramInformation data) {
    _seedData.add(data);
    notifyListeners();
  }

  void deleteTitle(int index) {
    _seedData.remove(index);
    notifyListeners();
  }

  void toggleProgress(ProgramInformation data, int progindex) {
    data.progress?[progindex] = !data.progress![progindex];
    notifyListeners();
  }

  List<ProgramInformation>? searchByWeekday(int? weekday) {
    return _seedData.where((element) => element.weekDays == weekday).toList();
  }
}
