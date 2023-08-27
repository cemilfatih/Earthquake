
import 'package:earthquake/core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProvider{
  ApplicationProvider._init();
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance{
    if(_instance == null) _instance = ApplicationProvider._init();
    return _instance!;
  }

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(create: (context) => ThemeNotifier()),
  ];
}