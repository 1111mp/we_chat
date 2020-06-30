import 'package:shared_preferences/shared_preferences.dart';

class SharePrefs {
  static SharePrefs _instance;

  static Future<SharePrefs> getInstance() async {
    if (_instance == null) {
      _instance = new SharePrefs();
      await _instance.init();
    }

    return _instance;
  }

  SharedPreferences prefs;

  SharePrefs() {
    // this.init();
  }

  Future init() async {
    this.prefs = await SharedPreferences.getInstance();
  }

  void setInt(String key, int value) {
    this.prefs.setInt(key, value);
  }

  int getInt(String key) {
    return this.prefs.getInt(key) ?? 0;
  }

  void setString(String key, String value) {
    this.prefs.setString(key, value);
  }

  String getString(String key) {
    return this.prefs.getString(key);
  }

  void setBool(String key, bool value) {
    this.prefs.setBool(key, value);
  }

  bool getBool(String key) {
    return this.prefs.getBool(key);
  }

  void setDouble(String key, double value) {
    this.prefs.setDouble(key, value);
  }

  double getDouble(String key) {
    return this.prefs.getDouble(key);
  }

  void setStrList(String key, List<String> value) {
    this.prefs.setStringList(key, value);
  }

  List<String> getStrList(String key) {
    return this.prefs.getStringList(key);
  }

  Set<String> getKeys() {
    return this.prefs.getKeys();
  }

  void remove(String key) {
    this.prefs.remove(key);
  }
}

// void aaa() async {
//   final prefs = await SharePrefs.getInstance();
// }
