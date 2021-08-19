import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/pages/root_app.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RootApp(),
  ));
}
