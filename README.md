[![pub package](https://img.shields.io/pub/v/flutter_slack_oauth.svg)](https://pub.dartlang.org/packages/flutter_slack_oauth) 

# flutter_slack_oauth
A flutter OAuth package for Slack with a beautiful "Sign in with Slack" button.

![](docs/img/button.png)

## Extensions:
* [flutter_slack_oauth_firebase](https://github.com/Kunstmaan/flutter_slack_oauth_firebase) integrates Firebase Auth and Cloud Firestore.

## Usage
To use this plugin, add `flutter_slack_oauth` as a dependency in your pubspec.yaml file.

![](docs/img/gif.gif)

### Example
``` dart
import 'package:flutter/material.dart';
import 'package:flutter_slack_oauth/flutter_slack_oauth.dart';

void main() {
  runApp(new MaterialApp(
    home: new Scaffold(
      body: new Builder(
        builder: (BuildContext context) {
          return new Center(
            child: new SlackButton(
              clientId: "XXX_CLIENT_ID_XXX",
              clientSecret: "XXX_CLIENT_SECRET_XXX",
              redirectUrl: "https://kunstmaan.github.io/flutter_slack_oauth/success.html",
              onSuccess: () async {
                String accessToken = await Token.getLocalAccessToken();
                UserList users = await slack.getUsers(accessToken);
                
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text('We found ' + users.users.length.toString() + " users"),
                ));
              },
              onFailure: () {
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text('Slack Login Failed'),
                ));
              },
              onCancelledByUser: () {
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text('Slack Login Cancelled by user'),
                ));
              },
            ),
          );
        },
      ),
    ),
  ));
}

```

### Don't want to use the bundled OAuth flow?
* You can also provide your own custom onTap behaviour by manually importing `package:flutter_slack_oauth/oauth/generic_slack_button.dart`.
* Or check out [flutter_slack_oauth_firebase](https://github.com/Kunstmaan/flutter_slack_oauth_firebase), where we use the `generic_slack_button` to integrate with Firebase Auth and Cloud Firestore.
