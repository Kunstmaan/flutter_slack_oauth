import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slack_oauth/oauth/model/token.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;

/// A webview used for the sign in with slack flow.
class SlackLoginWebViewPage extends StatefulWidget {
  const SlackLoginWebViewPage({
    required this.clientId,
    required this.clientSecret,
    required this.redirectUrl,
    required this.scope,
  });

  final String clientId;
  final String clientSecret;
  final String redirectUrl;
  final List scope;

  @override
  _SlackLoginWebViewPageState createState() =>
      new _SlackLoginWebViewPageState();
}

class _SlackLoginWebViewPageState extends State<SlackLoginWebViewPage> {
  bool setupUrlChangedListener = false;

  @override
  Widget build(BuildContext context) {
    final flutterWebviewPlugin = new FlutterWebviewPlugin();
    final String clientId = widget.clientId;
    final String redirectUrl = widget.redirectUrl;
    final String scope = widget.scope.join(',');

    if (!setupUrlChangedListener) {
      flutterWebviewPlugin.onUrlChanged.listen((String changedUrl) async {
        if (changedUrl.startsWith(widget.redirectUrl)) {
          Uri uri = new Uri().resolve(changedUrl);
          String? code = uri.queryParameters["code"];
          if (code == null) {
            return;
          }

          final http.Response response = await http
              .post(Uri.parse("https://slack.com/api/oauth.access"), body: {
            "client_id": widget.clientId,
            "redirect_uri": widget.redirectUrl,
            "client_secret": widget.clientSecret,
            "code": code,
          });

          Token token = new Token.fromMap(json.decode(response.body));
          await Token.storeAccessToken(token.accessToken);
          Navigator.of(context).pop(true);
        }
      });
      setupUrlChangedListener = true;
    }

    return new WebviewScaffold(
      appBar: new AppBar(
        title: new Text("Log in with Slack"),
      ),
      url:
          "https://slack.com/oauth/authorize?scope=$scope&team=T024ZT2L3&client_id=$clientId&redirect_uri=$redirectUrl",
    );
  }
}
