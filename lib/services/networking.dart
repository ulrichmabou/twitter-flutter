import 'package:twitter_api/twitter_api.dart';
import 'package:twitterflutter/utilities/secrets.dart';
import 'dart:convert';

Future main() async {
  // create twitterApi object
  final _twitterOauth = twitterApi(
    consumerKey: consumerApiKey,
    consumerSecret: consumerApiSecret,
    token: accessToken,
    tokenSecret: accessTokenSecret,
  );

  // make a request to Twitter
  Future twitterRequest = _twitterOauth.getTwitterRequest(
    "GET",
    "statuses/user_timeline.json",
    options: {
//      "user_id": "19025957",
      "screen_name": "ChelseaFC",
      "count": "1",
      "trim_user": "true",
      "tweet_mode": "extended", // Used to prevent truncating tweets
    },
  );

  // wait for the Future to finish
  var res = await twitterRequest;

  // print response
  print(res.statusCode);
  print(res.body);

  // Convert the string response into something more usable
  var tweets = json.decode(res.body);
  print(tweets);
}
