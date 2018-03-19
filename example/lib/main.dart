import 'package:flutter/material.dart';
import 'package:flutter_slack_oauth/flutter_slack_oauth.dart';

void main() {
  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text("Slack OAuth Example"),
      ),
      body: new Builder(
        builder: (BuildContext context) {
          return new Center(
            child: new SlackButton(
              clientId: "XXX_CLIENT_ID_XXX",
              clientSecret: "XXX_CLIENT_SECRET_XXX",
              redirectUrl:
              "https://kunstmaan.github.io/flutter_slack_oauth/success.html",
              onSuccess: () {
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text('Slack Login Success'),
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
