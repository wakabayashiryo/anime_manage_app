import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'database.dart';
import 'seedData.dart';

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
              programListWeekDay(DateTime.sunday),
              programListWeekDay(DateTime.monday),
              programListWeekDay(DateTime.tuesday),
              programListWeekDay(DateTime.wednesday),
              programListWeekDay(DateTime.thursday),
              programListWeekDay(DateTime.friday),
              programListWeekDay(DateTime.saturday)
            ],
          ),
        ));
  }
}

Widget programListWeekDay(int? weekday) {
  final List<ProgramInformation> _filterd =
      seedData.where((element) => element.weekDays == weekday).toList();

  return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _filterd.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            leading: Icon(Icons.beach_access), //<=change TV icon
            title: Text("${_filterd[index].title}"),
            subtitle: Text('Total Episodes ${_filterd[index].totalEpisode}'),
            trailing: Icon(Icons.favorite),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (BuildContext context) =>
                    _CheckboxList(contentInfo: _filterd[index]),
              ));
            });
      });
}

class _CheckboxList extends StatelessWidget {
  ProgramInformation contentInfo;

  _CheckboxList({required this.contentInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(contentInfo.title!)),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: contentInfo.progress!.length,
            itemBuilder: (BuildContext context, int index) {
              return CheckboxListTile(
                title: Text('Episode ${index + 1}'),
                // subtitle: Text('hoge'),
                secondary: Icon(Icons.beach_access),
                controlAffinity: ListTileControlAffinity.platform,
                onChanged: (bool? value) {
                  print("${contentInfo.progress![index]}\n");
                  if (value!)
                    contentInfo.progress![index] = false;
                  else
                    contentInfo.progress![index] = true;
                  print("${contentInfo.progress![index]}\n");
                },
                value: contentInfo.progress![index],
                activeColor: Colors.green,
                checkColor: Colors.white,
              );
            }));
  }
}
