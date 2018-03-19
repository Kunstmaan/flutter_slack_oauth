## [0.0.2] - 19 March 2018.

* Initial release
* Provides a `SlackButton` widget which is styled like an official "Sign in with Slack" button.
* Clicking a `SlackButton` starts a WebView, allowing the user to log in with Slack.
* SlackButton requires a client id, client secret, and 3 callbacks: `onSuccess`, `onFailure`, and `onCancelledByUser`.
* The resulting access token is stored in shared preferences (Android) and NSUserDefaults (iOS) (thanks `https://github.com/flutter/plugins/tree/master/packages/shared_preferences`) 
* Basic `/api/users.identity` call as PoC.
* Basic `/api/users.list` call as PoC.