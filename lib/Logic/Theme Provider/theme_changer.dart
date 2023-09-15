import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Data/Sqflite/database.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = true;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {

    _darkTheme = value;
    notifyListeners();
  }
}
