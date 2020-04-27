import 'package:flutter/material.dart';
import 'package:fluttersampleui/controller/JobsListView.dart';
import 'package:fluttersampleui/controller/ModulesListView.dart';

class ListViewApiPage extends StatefulWidget {
  static const String id = 'ListViewApiPage';

  @override
  _ListViewApiPageState createState() => _ListViewApiPageState();
}

class _ListViewApiPageState extends State<ListViewApiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LISTVIEW API'),
      ),
      body: Center(
        child: JobsListView(),
//        child: ModulesListView(),
      ),
    );
  }
}
