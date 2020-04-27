import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttersampleui/styles/main_style.dart';
import 'package:fluttersampleui/components/acwRoundedButton.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:fluttersampleui/controller/NewsController.dart';

Future<News> createNews(
    String title, String content, String dateFrom, String dateTo) async {
  final http.Response response = await http.post(
    'https://demo.auroracw.com/professional/api/rnd/PostNews.ashx',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{
        'Title': title,
        'Content': content,
        'DateFrom': dateFrom,
        'DateTo': dateTo,
      },
    ),
  );

  if (response.statusCode == 200) {
    return News.fromJson(json.decode(jsonEncode(
      <String, String>{
        'Title': title,
        'Content': content,
        'DateFrom': dateFrom,
        'DateTo': dateTo,
      },
    )));
  } else {
    throw Exception('Failed to create News.');
  }
}

class NewsDtlPage extends StatefulWidget {
  static const String id = 'NewsDtlPage';

  @override
  _NewsDtlPageState createState() => _NewsDtlPageState();
}

class _NewsDtlPageState extends State<NewsDtlPage> {
  final format = DateFormat("yyyy-MM-dd");
  final TextEditingController _txtTitle = TextEditingController();
  final TextEditingController _txtContent = TextEditingController();
  final TextEditingController _txtDateFrom = TextEditingController();
  final TextEditingController _txtDateTo = TextEditingController();

  Future<News> _futureNews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add News'),
      ),
//      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 30.0,
        ),
        child: (_futureNews == null)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Title : ',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    controller: _txtTitle,
                    textAlign: TextAlign.left,
                    decoration: myTextFieldDecorationDark.copyWith(
                      hintText: '',
                    ),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Content : ',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    controller: _txtContent,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    textAlign: TextAlign.left,
                    decoration: myTextFieldDecorationDark.copyWith(
                      hintText: '',
                    ),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Date From : ',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  DateTimeField(
                    controller: _txtDateFrom,
                    decoration: myTextFieldDecorationDark.copyWith(
                      hintText: '',
                    ),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                    format: format,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Date To : ',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  DateTimeField(
                    controller: _txtDateTo,
                    decoration: myTextFieldDecorationDark.copyWith(
                      hintText: '',
                    ),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                    format: format,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  AcwRoundedButton(
                    color: Colors.lightBlue,
                    title: 'SAVE NEWS',
                    onPressed: () {
                      setState(
                        () {
                          _futureNews = createNews(
                              _txtTitle.text,
                              _txtContent.text,
                              _txtDateFrom.text,
                              _txtDateTo.text);
                        },
                      );
                    },
                  ),
                ],
              )
            : FutureBuilder<News>(
                future: _futureNews,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
//                    return Text(snapshot.data.newsTitle);
                    Navigator.pop(context);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
      ),
    );
  }
}
