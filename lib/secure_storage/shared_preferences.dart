import 'dart:async';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefModel {
  final _storage = SharedPreferences.getInstance();
  Future<String> loggedRead() async{
    final storage = await _storage;
    final value = storage.getString('logged');
    return value ?? 'N';
  }
  Future<void> loggedWrite(String value) async{
    final storage = await _storage;
    await storage.setString('logged', value);
  }
  SharedPreferences? prefs;
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool?> saveLocale(Locale locale) async {
    prefs = await SharedPreferences.getInstance();
    return prefs?.setString('locale', locale.toString());
  }

  Future<String?> readLocale() async {
    return prefs?.getString('locale');
  }
}
