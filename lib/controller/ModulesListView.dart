import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Module {
  final String moduleCode;
  final String moduleLabel;
  final String moduleIcon;
  final String moduleUrl;

  Module({this.moduleCode, this.moduleLabel, this.moduleIcon, this.moduleUrl});

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      moduleCode: json['ModuleCode'],
      moduleLabel: json['ModuleLabel'],
      moduleIcon: json['ModuleIcon'],
      moduleUrl: json['Url'],
    );
  }
}

Future<List<Module>> _fetchModules() async {
  final myApiURL =
      'http://YOUR_API_URL';
  final response = await http.get(myApiURL);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((module) => new Module.fromJson(module)).toList();
  } else {
    throw Exception('Failed to load API - Module');
  }
}

class ModulesListView extends StatefulWidget {
  @override
  _ModulesListViewState createState() => _ModulesListViewState();
}

class _ModulesListViewState extends State<ModulesListView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Module>>(
      future: _fetchModules(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Module> data = snapshot.data;
          return _moduleListView(data);
        }
        else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  ListView _moduleListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            child: _tile(data[index].moduleLabel, data[index].moduleIcon,
                data[index].moduleUrl),
          );
        });
  }

  ListTile _tile(String moduleLabel, String moduleIcon, String moduleUrl) {
    String isValid = iconMapping[moduleIcon].toString();

    return ListTile(
      title: Text(
        moduleLabel,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20.0,
        ),
      ),
      subtitle: Text(moduleUrl),
      leading: isValid == 'null'
          ? FaIcon(FontAwesomeIcons.user)
          : FaIcon(iconMapping[moduleIcon]),
      onTap: () {
//        print(moduleUrl.toString());
        final snackBar = SnackBar(
          content: Text(moduleUrl.toString()),
          action: SnackBarAction(
            label: '(Close)',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );

        // Find the Scaffold in the widget tree and use
        // it to show a SnackBar.
        Scaffold.of(context).showSnackBar(snackBar);
      },
    );
  }

  Map<String, IconData> iconMapping = {
    'fa-users': FontAwesomeIcons.users,
    'fa-newspaper-o': FontAwesomeIcons.newspaper,
    'fa-calculator': FontAwesomeIcons.calculator,
    'fa-clock-o': FontAwesomeIcons.clock,
    'fa-money': FontAwesomeIcons.dollarSign,
  };
}
