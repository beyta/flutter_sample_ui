import 'package:flutter/material.dart';

class ColumnPage extends StatefulWidget {
  static const String id = 'ColumnPage';

  @override
  _ColumnPageState createState() => _ColumnPageState();
}

class _ColumnPageState extends State<ColumnPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text('Column Sample')
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 30.0) ,
          width: double.infinity,
          height: double.infinity,

          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                color: Colors.orange,
              ),
              SizedBox(height: 10.0,),
              Container(
                height: 100,
                width: 100,
                color: Colors.orange,
              ),
              SizedBox(height: 10.0,),
              Container(
                height: 100,
                width: 100,
                color: Colors.orange,
              ),
              SizedBox(height: 10.0,)
            ],
          ),
        ),
      ),
    );
  }
}
