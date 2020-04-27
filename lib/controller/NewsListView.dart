import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:fluttersampleui/components/acwRoundedButton.dart';

import 'dart:async';
import 'dart:convert';

import 'package:fluttersampleui/screens/newsdtl_page.dart';
import 'package:fluttersampleui/controller/NewsController.dart';

Future<List<News>> _fetchNews() async {
  final myApiURL =
      'http://YOUR_API_URL';
  final response = await http.get(myApiURL);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((news) => new News.fromJson(news)).toList();
  } else {
    throw Exception('Failed to load API - Module');
  }
}

//Widget_begin
class NewsListView extends StatefulWidget {
  @override
  _NewsListViewState createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<News>>(
      future: _fetchNews(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<News> data = snapshot.data;

          return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: <Widget>[
                AcwRoundedButton(
                  color: Colors.lightBlueAccent,
                  title: 'New',
                  onPressed: () async {
                    Navigator.pushNamed(context, NewsDtlPage.id);
                  },
                ),
                SizedBox(height: 8.0),
                _newsListView(data),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  ListView _newsListView(data) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            child: _tile(data[index].newsId, data[index].newsDate,
                data[index].newsTitle, data[index].newsDetail),
          );
        });
  }

  ListTile _tile(
      String newsId, String newsDate, String newsTitle, String newsDetail) {
    return ListTile(
      isThreeLine: true,
      title: Text(
        newsTitle,
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w700,
          color: Colors.amberAccent,
        ),
      ),
      subtitle: Text(newsDetail),
      trailing: Text(
        newsDate,
        style: TextStyle(
          fontSize: 11.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: FaIcon(FontAwesomeIcons.newspaper),
    );
  }
}

//Widget_end
