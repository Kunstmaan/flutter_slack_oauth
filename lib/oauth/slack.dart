import 'dart:async';
import 'dart:convert';

import 'package:flutter_slack_oauth/oauth/model/user.dart';
import 'package:flutter_slack_oauth/oauth/model/user_identity.dart';
import 'package:http/http.dart' as http;

/// Implements the /api/users.identity call
Future<UserIdentity> getUserIdentity(String accessToken) async {
  String endpoint = "https://slack.com/api/users.identity?token=$accessToken";
  final http.Response response = await http.get(endpoint);

  return new UserIdentity.fromMap(JSON.decode(response.body));
}

/// Implements the /api/users.list call
Future<UserList> getUsers(String accessToken) async {
  String endpoint = "https://slack.com/api/users.list?token=$accessToken";
  final http.Response response = await http.get(endpoint);

  return new UserList.fromMap(JSON.decode(response.body));
}
