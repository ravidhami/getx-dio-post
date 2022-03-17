import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home.dart';
import 'httpservice.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    home: HomeScreen(),
  ));
}
