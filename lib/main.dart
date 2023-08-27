import 'package:earthquake/core/init/notifier/notifier_list.dart';
import 'package:flutter/material.dart';
import 'package:earthquake/product/feature/earthquake/view/earthquakeView.dart';
import 'package:provider/provider.dart';

import 'core/init/notifier/theme_notifier.dart';

void main() {
  runApp(
    MultiProvider(providers: [...ApplicationProvider.instance.dependItems],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Earthquake App Demo',
      theme: context.watch<ThemeNotifier>().currentTheme,
      home: earthquakesDisplay(),
    );
  }
}
