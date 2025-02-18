

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefService{

  Future<void> writeCache(String key, Map<String, dynamic> value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    String jsonString = jsonEncode(value);

    bool isSaved = await pref.setString(key, jsonString);
  }

  Future<String?> readCache(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    String? value = pref.getString(key);
    if(value != null){
      return value;
    }
    return null;
  }


  Future<void> clearCache() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    bool isCleared = await pref.clear();
  }
}