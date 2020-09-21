import 'package:flutter/material.dart';
import 'package:translate_app/screens/my_note.dart';
import 'package:translate_app/api.dart';
import 'dart:convert';

class TranslationScreen extends StatefulWidget {
  @override
  _TranslationScreenState createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  String url;
  TextEditingController enController = TextEditingController();
  TextEditingController koController = TextEditingController();
  var Data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextBox(),
                Icon(
                  Icons.arrow_forward,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 30),
                  child: Text(
                    'Korean',
                    style: TextStyle(fontSize: 25, color: Color(0xff8A3030)),
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 200,
                    width: 150,
                    color: Color(0xffeeeeee),
                    padding: EdgeInsets.all(10.0),
                    child: new ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 200.0,
                      ),
                      child: new Scrollbar(
                        child: new SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          reverse: true,
                          child: SizedBox(
                            height: 190.0,
                            child: new TextField(
                              controller: enController,
                              maxLines: 100,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Add your text here',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 200,
                    width: 150,
                    color: Color(0xffeeeeee),
                    padding: EdgeInsets.all(10.0),
                    child: new ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 200.0,
                      ),
                      child: new Scrollbar(
                        child: new SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          reverse: true,
                          child: SizedBox(
                            height: 190.0,
                            child: new TextField(
                              controller: koController,
                              maxLines: 100,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Add your text here',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ))
            ]),
            Padding(
                padding: EdgeInsets.all(25),
                child: Container(
                  width: 200,
                  color: Color(0xffE97C7C),
                  child: FlatButton(
                      onPressed: () async {
                        url = "https://prac-dep.herokuapp.com/api?word=" +
                            enController.text;
                        Data = await Getdata(url);
                        var DecodedData = jsonDecode(Data);
                        setState(() {
                          koController.text = DecodedData['translatedText'];
                        });
                      },
                      child: Text('Translate')),
                )),
            BtnContainer2(),
          ],
        ),
      ),
    );
  }
}

class TextBox extends StatefulWidget {
  @override
  _TextBoxState createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 40),
      child: Text(
        'English',
        style: TextStyle(fontSize: 25, color: Color(0xff8A3030)),
      ),
    );
  }
}

class BtnContainer extends StatefulWidget {
  var enText = TextEditingController();

  BtnContainer(this.enText);

  @override
  _BtnContainerState createState() => _BtnContainerState();
}

class _BtnContainerState extends State<BtnContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Color(0xffE97C7C),
      child: FlatButton(
          onPressed: () {
            print(widget.enText.text);
          },
          child: Text('Translate')),
    );
  }
}

class BtnContainer2 extends StatefulWidget {
  @override
  _BtnContainer2State createState() => _BtnContainer2State();
}

class _BtnContainer2State extends State<BtnContainer2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Color(0xffE97C7C),
      child: FlatButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyNote()));
            });
          },
          child: Text('My Note')),
    );
  }
}
