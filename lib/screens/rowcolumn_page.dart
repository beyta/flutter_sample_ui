import 'package:flutter/material.dart';

class RowColumnPage extends StatefulWidget {
  static const String id = 'RowColumnPage';

  @override
  _RowColumnPageState createState() => _RowColumnPageState();
}

class _RowColumnPageState extends State<RowColumnPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Row Column Sample'),
        ),
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 30,
                      width: 30,
                      color: Colors.orange,
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      height: 30,
                      width: 30,
                      color: Colors.orange,
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 30,
                      width: 30,
//                      color: Colors.red,
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      height: 30,
                      width: 30,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
