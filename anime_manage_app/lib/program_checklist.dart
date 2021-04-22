import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'database.dart';

class ProgramChecklists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            //backgroundColor: Colors.green,
            title: TabBar(
              dragStartBehavior: DragStartBehavior.down,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2.5,
              indicatorPadding: EdgeInsets.all(5),
              isScrollable: true,
              labelColor: Colors.white,
              labelPadding: EdgeInsets.all(10),
              labelStyle: TextStyle(fontSize: 17.0),
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
            children: <Widget>[
              ProgramListWeekDay(DateTime.sunday),
              ProgramListWeekDay(DateTime.monday),
              ProgramListWeekDay(DateTime.tuesday),
              ProgramListWeekDay(DateTime.wednesday),
              ProgramListWeekDay(DateTime.thursday),
              ProgramListWeekDay(DateTime.friday),
              ProgramListWeekDay(DateTime.saturday)
            ],
          ),
        ));
  }
}

class ProgramListWeekDay extends StatelessWidget {
  final int? weekday;
  ProgramListWeekDay(this.weekday);

  @override
  Widget build(BuildContext context) {
    final List<ProgramInformation>? _titleList =
        Provider.of<ProgramInfoModel>(context, listen: false)
            .searchByWeekday(weekday);

    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _titleList?.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading: Icon(Icons.beach_access), //<=change TV icon
              title: Text("${_titleList?[index].title}"),
              subtitle:
                  Text('Total Episodes ${_titleList?[index].totalEpisode}'),
              trailing: Icon(Icons.favorite),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute<void>(
                  builder: (BuildContext context) =>
                      _CheckboxListPage(contentInfo: _titleList?[index]),
                ));
              });
        });
  }
}

class _CheckboxListPage extends StatelessWidget {
  final ProgramInformation? contentInfo;

  _CheckboxListPage({required this.contentInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(contentInfo!.title!)),
        body: Consumer<ProgramInfoModel>(builder:
            (BuildContext context, ProgramInfoModel value, Widget? child) {
          return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: contentInfo!.progress!.length,
              itemBuilder: (BuildContext context, int index) {
                return CheckboxListTile(
                  title: Text('Episode ${index + 1}'),
                  // subtitle: Text('hoge'),
                  secondary: Icon(Icons.beach_access),
                  controlAffinity: ListTileControlAffinity.platform,
                  onChanged: (bool? value) {
                    Provider.of<ProgramInfoModel>(context, listen: false)
                        .toggleProgress(contentInfo!, index);
                  },
                  value: contentInfo!.progress![index],
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                );
              });
        }));
  }
}
