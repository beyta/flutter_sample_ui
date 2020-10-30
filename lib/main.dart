import 'package:flutter/material.dart';
import 'package:fluttersampleui/functions/navigation.dart';
import 'package:fluttersampleui/screens/decimal_input_page.dart';
import 'package:fluttersampleui/screens/news_page.dart';
import 'package:fluttersampleui/screens/row_page.dart';
import 'screens/main_page.dart';
import 'screens/email_regex_page.dart';
import 'screens/login_page.dart';
import 'screens/register_page.dart';
import 'screens/bmi1_page.dart';
import 'screens/bmi2_page.dart';
import 'screens/home_page.dart';
import 'screens/listviewapi_page.dart';
import 'screens/newsdtl_page.dart';
import 'screens/column_page.dart';
import 'screens/row_page.dart';
import 'screens/rowcolumn_page.dart';

//Author : Beyta
//Created On : 2020 - 04 - 07

void main() => runApp(MyFlutterSample());

class MyFlutterSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(),
      title: 'My Flutter Sample',
      home: MainPage(),
      routes: {
        DecimalInputPage.id: (context) => DecimalInputPage(),
        EmailRegexPage.id: (context) => EmailRegexPage(),
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        Bmi1Page.id: (context) => Bmi1Page(),
        Bmi2Page.id: (context) => Bmi2Page(),
        HomePage.id: (context) => HomePage(),
        ListViewApiPage.id: (context) => ListViewApiPage(),
        NewsPage.id: (context) => NewsPage(),
        NewsDtlPage.id: (context) => NewsDtlPage(),
        ColumnPage.id: (context) => ColumnPage(),
        RowPage.id: (context) => RowPage(),
        RowColumnPage.id: (context) => RowColumnPage(),
      },
    );
  }
}
