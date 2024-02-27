import 'package:flutter/material.dart';
import 'package:totem/app/app.dart';
import 'package:totem/app/injector.dart';

void main() {
  setupDependencies();
  runApp(const Totem());
}
