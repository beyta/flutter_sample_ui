import 'package:flutter/material.dart';

class RowPage extends StatefulWidget {
  static const String id = 'RowPage';

  @override
  _RowPageState createState() => _RowPageState();
}

class _RowPageState extends State<RowPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Row Sample'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,

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
      )
    );
  }
}
