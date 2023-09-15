import 'package:earthquake_listing/product/feature/splash/modelView/splashModelView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/init/notifier/notifier_list.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
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
      home: splashView(),
    );
  }
}
