import 'package:flutter/material.dart';
import 'package:vurelo/app/inject_dependencies.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();

  runApp(const App());
}
