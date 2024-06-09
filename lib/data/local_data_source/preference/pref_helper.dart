import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/logger/log.dart';
import 'i_pref_helper.dart';

class PrefHelper implements IPrefHelper {
  late final SharedPreferences _pref;

  PrefHelper(SharedPreferences preferences) : _pref = preferences;

  @override
  String? retrieveToken() {
    if (_pref.containsKey("userToken")) {
      return _pref.getString("userToken");
    } else {
      return null;
    }
  }

  void saveToken(value) {
    d("userToken => $value");
    _pref.setString("userToken", value);
  }

  @override
  void clear() {
    _pref.clear();
  }

  @override
  SharedPreferences get() {
    return _pref;
  }

  @override
  void removeToken() {
    _pref.remove('userToken');
  }

  @override
  void removeUser() {
    _pref.remove('user_data');
  }

  @override
  bool? getBool(String key) {
    if (_pref.containsKey(key)) {
      return _pref.getBool(key);
    }
    return null;
  }

  @override
  void saveBool(String key, bool value) {
    _pref.setBool(key, value);
  }

  @override
  Map<String, dynamic>? getJson(String key) {
    final data = _pref.getString(key);
    if (data != null) {
      return jsonDecode(data);
    }
    return null;
  }

  @override
  void saveJson(Map data, String key) {
    _pref.setString(key, jsonEncode(data));
  }

  @override
  void setProfilePic(String imageLink) {
    _pref.setString("image_link", imageLink);
  }

  @override
  String? getProfilePic() {
    return _pref.getString("image_link");
  }

  @override
  int? getInt(String key) {
    return _pref.getInt(key);
  }

  @override
  Future<void> setInt(String key, int value) async {
    await _pref.setInt(key, value);
  }

  String? getEMDRBlstSound() {
    if (_pref.containsKey("EMDRBlstSound")) {
      return _pref.getString("EMDRBlstSound");
    } else {
      return null;
    }
  }

  @override
  String? getEMDRSleepSound() {
    if (_pref.containsKey("EMDRSleepSound")) {
      return _pref.getString("EMDRSleepSound");
    } else {
      return null;
    }
  }

  @override
  String? getEMDRVisualSound() {
    if (_pref.containsKey("EMDRVisualSound")) {
      return _pref.getString("EMDRVisualSound");
    } else {
      return null;
    }
  }

  @override
  setEMDRBlstSound(String sound) {
    _pref.setString("EMDRBlstSound", sound);
  }

  @override
  setEMDRSleepSound(String sound) {
    _pref.setString("EMDRSleepSound", sound);
  }

  @override
  setEMDRVisualSound(String sound) {
    _pref.setString("EMDRVisualSound", sound);
  }

  @override
  void saveRefreshToken(value) {
    _pref.setString("userRefreshToken", value);
  }

  @override
  String? retrieveRefreshToken() {
    if (_pref.containsKey("userRefreshToken")) {
      return _pref.getString("userRefreshToken");
    } else {
      return null;
    }
  }
}
