import 'package:real_estate_app/Utils/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  final SharedPreferences prefs = locator.get<SharedPreferences>();

  Future<bool> changeLang(String lang) async {
    SharedPreferences prefs = locator.get<SharedPreferences>();
    return prefs.setString('lang', lang);
  }

}