import "package:flutter/material.dart";
import "package:flutter_webview_plugin/flutter_webview_plugin.dart";
import "dart:math";

void main() => runApp(new Login());

class Login extends StatelessWidget 
{
  static String authorizationUrl = "https://www.reddit.com/api/v1/authorize.compact?client_id=h3_JRyYIEXZ__Q&response_type=code&redirect_uri=https://github.com/PiwwowPants&duration=permanent&scope=identity,edit,flair,history,modconfig,modflair,modlog,modposts,modwiki,mysubreddits,privatemessages,read,report,save,submit,subscribe,vote,wikiedit,wikiread&state=";
  static String randomString = "mejdownsatto";

  @override
  Widget build(BuildContext context)
  {
    return new MaterialApp
    (
      theme: new ThemeData
      (
        primarySwatch: Colors.blue
      ),
      title: "Atto",
      home: new LandingPage(),
      routes:
      {
        "/oauth": (_) => new WebviewScaffold
        (
          appBar: new AppBar
          (
            title: new Text("Log into Reddit")
          ),
          url: authorizationUrl + randomString
        ),
      }
    );
  }
}

class LandingPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      body: new ListView
      (
        children:
        [
          new Container
          (
            padding: new EdgeInsets.all(32.0),
            child: new Text
            (
              "In order to save everyone time, this app requires authentication.",
              textAlign: TextAlign.center,
              style: new TextStyle
              (
                fontSize: 32.0
              )
            )
          ),
          new Container
          (
            padding: new EdgeInsets.all(32.0),
            child: new RaisedButton
            (
              padding: new EdgeInsets.all(16.0),
              textColor: Colors.white,
              color: Theme.of(context).accentColor,
              child: new Text
              (
                "Login",
                textAlign: TextAlign.center,
                style: new TextStyle
                (
                  fontSize: 24.0
                )
              ),
              onPressed: () {
                generateNewRandomString();
                Navigator.of(context).pushNamed("/oauth");
              },
            )
          )
        ],
      )
    );
  }

  generateNewRandomString()
  {
    Login.randomString = "mejdownsatto" + new Random().nextInt(1<<32).toString();
  }
}