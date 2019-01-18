## [0.3.0] - 18 January 2019
* Updated Slack icon to the most recent version
* Refactored to Stateless widgets

## [0.2.0] - 28 September 2018
* **BREAKING - Required for Flutter Release Preview 2**
* Updated deprecated dependencies and Dart 2 issues.

## [0.1.1] - 10 April 2018
* **BREAKING - Required for Flutter Beta 2**
* Required changes to support Dart 2 (and Flutter Beta 2).

## [0.1.0] - 30 March 2018
* `SlackButton` now uses a `GenericSlackButton` which is not exposed by default.
* `GenericSlackButton` can have a custom onTap callback so you can hook up your custom logic, such as binding Firebase Auth.
* To use `GenericSlackButton`, you need to manually import `package:flutter_slack_oauth/oauth/generic_slack_button.dart`, it is not exposed by default.

## [0.0.5] - 29 March 2018
* Formatted with dartfmt

## [0.0.4] - 19 March 2018
* Slack WebView now has action bar so back behaviour is possible on iOS

## [0.0.2] - 19 March 2018
* Initial release
* Provides a `SlackButton` widget which is styled like an official "Sign in with Slack" button.
* Clicking a `SlackButton` starts a WebView, allowing the user to log in with Slack.
* SlackButton requires a client id, client secret, and 3 callbacks: `onSuccess`, `onFailure`, and `onCancelledByUser`.
* The resulting access token is stored in shared preferences (Android) and NSUserDefaults (iOS) (thanks `https://github.com/flutter/plugins/tree/master/packages/shared_preferences`) 
* Basic `/api/users.identity` call as PoC.
* Basic `/api/users.list` call as PoC.