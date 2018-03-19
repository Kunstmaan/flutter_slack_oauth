import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

/// A Token is the container for the Slack access token.
///
/// Recommended to store the access token in LocalStorage, so users don't need to log in every time
class Token {
  String accessToken;
  String tokenType;

  Token.fromMap(Map json){
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  static Future<String> getLocalAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString("slack_access_token");
    return accessToken;
  }

  static Future<void> storeAccessToken(String accessToken) async {
    return SharedPreferences.getInstance().then((sharedPreferences) => sharedPreferences.setString('slack_access_token', accessToken));
  }
}