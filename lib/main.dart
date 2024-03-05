import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:totem/app/app.dart';
import 'package:totem/app/injector.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    WindowManager.instance.setMinimumSize(const Size(600, 600));
  }

  setupDependencies();
  runApp(const Totem());
}
