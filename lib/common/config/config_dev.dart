import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Map<String, String> DevConfig = {
  'baseUrl': 'http://192.168.80.208:3000',
  'token': 'TOKEN',
};

void devConfigLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Color(0xFF000000).withOpacity(0.4)
    ..textColor = Colors.white
    ..indicatorColor = Colors.white
    ..progressColor = Colors.white
    ..errorWidget = errorWidget();
}

Widget errorWidget() {
  return Icon(
    IconData(0xe6b7, fontFamily: 'IconFont'),
    color: Colors.white,
    size: 40.0,
  );
}
