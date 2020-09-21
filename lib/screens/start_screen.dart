import 'package:flutter/material.dart';

import 'package:translate_app/screens/translation_page.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreen createState() => _StartScreen();
}

class _StartScreen extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("MY",
                style: TextStyle(fontSize: 25, color: Color(0xffE96A6A))),
            Padding(
                padding: EdgeInsets.only(
                  bottom: 50,
                ),
                child: Text("DICTIONARY",
                    style: TextStyle(fontSize: 25, color: Color(0xffE96A6A)))),
            Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Container(
                width: 200,
                height: 55,
                color: Color(0xffe97c7c),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TranslationScreen()));
                    });
                  },
                  child: Text(
                    "Translate",
                    style: TextStyle(color: Color(0xff8A3030)),
                  ),
                ),
              ),
            ),
            Container(
              width: 200,
              height: 55,
              color: Color(0xffe97c7c),
              child: FlatButton(
                onPressed: null,
                child: Text(
                  "My Note",
                  style: TextStyle(color: Color(0xff8A3030)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
