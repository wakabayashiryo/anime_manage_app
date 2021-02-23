import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProgramChecklists extends StatefulWidget {
  @override
  _ProgramChecklistsState createState() => _ProgramChecklistsState();
}

class _ProgramChecklistsState extends State<ProgramChecklists> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            // backgroundColor: Colors.gree,
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
            children: [
              ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        leading: Icon(Icons.beach_access),
                        title: Text('hoge'),
                        subtitle: Text('hoge'),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (BuildContext context) => _checkboxList(),
                          ));
                        });
                  }),
              CheckboxListTile(
                title: Text('test'),
                secondary: Icon(Icons.beach_access),
                onChanged: null,
                value: true,
              ),
              CheckboxListTile(
                title: Text('test'),
                secondary: Icon(Icons.beach_access),
                onChanged: null,
                value: true,
              ),
              CheckboxListTile(
                title: Text('test'),
                secondary: Icon(Icons.beach_access),
                onChanged: null,
                value: true,
              ),
              CheckboxListTile(
                title: Text('test'),
                secondary: Icon(Icons.beach_access),
                onChanged: null,
                value: true,
              ),
              CheckboxListTile(
                title: Text('test'),
                secondary: Icon(Icons.beach_access),
                onChanged: null,
                value: true,
              ),
              CheckboxListTile(
                title: Text('test'),
                secondary: Icon(Icons.beach_access),
                onChanged: null,
                value: true,
              ),
            ],
          ),
        ));
  }
}

class _checkboxList extends StatefulWidget {
  @override
  __checkboxListState createState() => __checkboxListState();
}

class __checkboxListState extends State<_checkboxList> {
  bool _checked;

  @override
  void initState() {
    _checked = true;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text('test')
        ),
        body: CheckboxListTile(
          title: Text('test'),
          subtitle: Text('hoge'),
          secondary: Icon(Icons.beach_access),
          controlAffinity: ListTileControlAffinity.platform,
          onChanged: (bool value) {
            setState(() {
              _checked = value;
            });
          },
          value: _checked,
          activeColor: Colors.green,
          checkColor: Colors.white,
    ));
  }
}
