import 'package:flutter/material.dart';
import 'package:fluttersampleui/controller/NewsListView.dart';

class NewsPage extends StatefulWidget {
  static const String id = 'NewsPage';

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NEWS'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
        child: Center(
          child: NewsListView(),
        ),
      ),
    );
  }
}
