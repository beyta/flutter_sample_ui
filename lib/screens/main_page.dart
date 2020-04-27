import 'package:flutter/material.dart';
import 'package:fluttersampleui/functions/navigation.dart';

//Import Style Library
import 'package:fluttersampleui/styles/main_style.dart';

//Import Page
import 'package:fluttersampleui/screens/decimal_input_page.dart';
import 'package:fluttersampleui/screens/email_regex_page.dart';
import 'package:fluttersampleui/screens/login_page.dart';
import 'package:fluttersampleui/screens/bmi1_page.dart';
import 'package:fluttersampleui/screens/home_page.dart';
import 'package:fluttersampleui/screens/listviewapi_page.dart';
import 'package:fluttersampleui/screens/news_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter Sample'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                'Money Text Field',
                style: myListStyleText,
              ),
              onTap: () {
                Navigator.pushNamed(context, DecimalInputPage.id);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                'Regex Validation (Email)',
                style: myListStyleText,
              ),
              onTap: () {
                Navigator.pushNamed(context, EmailRegexPage.id);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                'Login Page',
                style: myListStyleText,
              ),
              onTap: () {
                Navigator.pushNamed(context, LoginPage.id);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                'API Sample',
                style: myListStyleText,
              ),
              onTap: () {
                print('y');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text('BMI Calculator', style: myListStyleText,),
              subtitle: Text(
                  'A simple card BMI Calculator.'
              ),
              trailing: Icon(Icons.more_vert),
              onTap: () {
                Navigator.pushNamed(context, Bmi1Page.id);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                'Home Page Sample',
                style: myListStyleText,
              ),
              onTap: () {
                Navigator.pushNamed(context, HomePage.id);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                'List View with API',
                style: myListStyleText,
              ),
              onTap: () {
                Navigator.pushNamed(context, ListViewApiPage.id);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                'News (List & Form) with API',
                style: myListStyleText,
              ),
              onTap: () {
                Navigator.pushNamed(context, NewsPage.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
