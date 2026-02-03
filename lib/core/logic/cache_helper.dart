import 'package:cosmetics/views/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void setIsNotFirstTime() {
    _prefs.setBool("isFirstTime", false);
  }

  static bool get isFirstTime {
    return _prefs.getBool("isFirstTime") ?? true;
  }

  static void setEmail(String email) {
    _prefs.setString("email", email);
  }

  static String get email {
    return _prefs.getString("email") ?? "";
  }

  static bool get isAuth {
    return token.isNotEmpty;
  }

  static String get token {
    return _prefs.getString("token") ?? "";
  }

  static Future<void> saveUserData(UserData model) async {
    _prefs.setString("token", model.token);
    _prefs.setInt("id", model.user.id);
    _prefs.setString("username", model.user.username);
    _prefs.setString("countryCode", model.user.countryCode);
    _prefs.setString("phoneNumber", model.user.phoneNumber);
    _prefs.setString("email", model.user.email);
    _prefs.setString("role", model.user.role);
    _prefs.setString("profilePhotoUrl", model.user.profilePhotoUrl);
  }

  static Future<void> logout() async {
    await _prefs.remove("token");
    await _prefs.remove("id");
    await _prefs.remove("username");
    await _prefs.remove("phoneNumber");
    await _prefs.remove("countryCode");
    await _prefs.remove("profilePhotoUrl");
    await _prefs.remove("role");
    await _prefs.remove("email");
  }
}
