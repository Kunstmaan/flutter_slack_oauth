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
class SlackButton extends StatefulWidget {
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
  _SlackButtonState createState() => new _SlackButtonState();
}

class _SlackButtonState extends State<SlackButton>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new GenericSlackButton(
        clientId: widget.clientId,
        clientSecret: widget.clientSecret,
        onSuccess: widget.onSuccess,
        onCancelledByUser: widget.onCancelledByUser,
        onFailure: widget.onFailure,
        onTap: onTap);
  }

  onTap() async {
    bool success = await Navigator.of(context).push(new MaterialPageRoute<bool>(
          builder: (BuildContext context) => new SlackLoginWebViewPage(
                clientId: widget.clientId,
                clientSecret: widget.clientSecret,
                redirectUrl: widget.redirectUrl == null
                    ? "https://kunstmaan.github.io/flutter_slack_oauth/success.html"
                    : widget.redirectUrl,
              ),
        ));

    // if success == null, user just closed the webview
    if (success == null) {
      widget.onCancelledByUser();
    } else if (success == false) {
      widget.onFailure();
    } else if (success) {
      widget.onSuccess();
    }
  }
}
