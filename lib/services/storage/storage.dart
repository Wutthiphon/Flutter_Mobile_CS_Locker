import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Future<SharedPreferences> get prefs async {
    return await SharedPreferences.getInstance();
  }

  Future<void> saveData(String key, String value) async {
    final SharedPreferences prefs = await this.prefs;
    await prefs.setString(key, value);
  }

  Future<String?> getData(String key) async {
    final SharedPreferences prefs = await this.prefs;
    return prefs.getString(key);
  }

  Future<void> remove(String key) async {
    final SharedPreferences prefs = await this.prefs;
    await prefs.remove(key);
  }
}
