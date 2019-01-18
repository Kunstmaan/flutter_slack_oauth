library flutter_slack_oauth;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slack_oauth/oauth/generic_slack_button.dart';
import 'package:flutter_slack_oauth/oauth/slack_login.dart';

export 'oauth/model/token.dart';
export 'oauth/model/user.dart';
export 'oauth/slack.dart';
export 'oauth/slack_login.dart';

/// A button widget matching the official "Sign in with Slack" design
///
/// It requires a Slack client_id and client_secret, and success/failure/cancel callbacks
class SlackButton extends StatelessWidget {
  final VoidCallback onSuccess;
  final VoidCallback onCancelledByUser;
  final VoidCallback onFailure;

  final String clientId;
  final String clientSecret;
  final String redirectUrl;

  const SlackButton(
      {@required this.clientId,
      @required this.clientSecret,
      @required this.onSuccess,
      @required this.onCancelledByUser,
      @required this.onFailure,
      this.redirectUrl});

  bool get enabled => onSuccess != null;

  @override
  Widget build(BuildContext context) {
    return new GenericSlackButton(
        clientId: clientId,
        clientSecret: clientSecret,
        onSuccess: onSuccess,
        onCancelledByUser: onCancelledByUser,
        onFailure: onFailure,
        onTap: () {
          onTap(context);
        });
  }

  onTap(BuildContext context) async {
    bool success = await Navigator.of(context).push(new MaterialPageRoute<bool>(
      builder: (BuildContext context) => new SlackLoginWebViewPage(
            clientId: clientId,
            clientSecret: clientSecret,
            redirectUrl: redirectUrl == null
                ? "https://kunstmaan.github.io/flutter_slack_oauth/success.html"
                : redirectUrl,
          ),
    ));

    // if success == null, user just closed the webview
    if (success == null) {
      onCancelledByUser();
    } else if (success == false) {
      onFailure();
    } else if (success) {
      onSuccess();
    }
  }
}
