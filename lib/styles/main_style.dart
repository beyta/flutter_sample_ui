import 'package:flutter/material.dart';

const txtRadius = 10.0;

const myTextFieldDecorationLight = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(fontSize: 20.0, color: Colors.black54),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(txtRadius)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(txtRadius)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(txtRadius)),
  ),
);

const myTextFieldDecorationDark = InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(txtRadius)),
  ),
  fillColor: Colors.white,
);

const myListStyleText = TextStyle(
  fontSize: 20.0,
);

//acwCardDark
const myAcwCardDarkActive = Color(0xFF1D1E33);
const myAcwCardDarkInactive = Color(0xFF111328);

const myAcwCardDarkLabel = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const myAcwCardDarkTextNumber = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const myAcwCardDarkTitle =
    TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold);
