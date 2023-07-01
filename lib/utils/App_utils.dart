
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
const lightblackColor = Colors.black54;

var blackRegular14 = TextStyle(
  color: Colors.black,
  fontSize: 14,
  fontWeight: FontWeight.w300,
);

TextStyle blackBold14 = TextStyle(
  color: Colors.black,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

var blackRegular16 = TextStyle(
  color: Colors.black,
  fontSize: 16,
  fontWeight: FontWeight.w300,
);

var blackBold16 = TextStyle(
  color: Colors.black,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

var lightBlackRegular16 = TextStyle(
  color: lightblackColor,
  fontSize: 16,
  fontWeight: FontWeight.w300,
);

var lightBlackBold16 = TextStyle(
  color: lightblackColor,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

var hintTextStyle = TextStyle(
  color: Colors.grey,
  fontSize: 14,
  fontWeight: FontWeight.w300,
);

var whiteRegular14 = TextStyle(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.w300,
);

var whiteBold14 = TextStyle(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

var whiteRegular16 = TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontWeight: FontWeight.w300,
);

var whiteBold16 = TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

pushReplaceNamed({route}) {
  navigatorKey.currentState?.pushReplacementNamed(route);
}