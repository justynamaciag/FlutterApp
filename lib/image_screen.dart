import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ImageScreen extends StatefulWidget {
  @override
  ImageScreenState createState() {
    return ImageScreenState();
  }
}
class ImageScreenState extends State<ImageScreen> {

  String _url = getNewUrl();
  static String getNewUrl() {
    return 'http://thecatapi.com/api/images/get?format=src&type=jpg&size=small'
        '#${new DateTime.now().millisecondsSinceEpoch}';
  }
    @override
    Widget build(BuildContext context){
      return Container(
        margin: EdgeInsets.only(top: 30.0),
        color: const Color(0xffe5a9cb),
        child:Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 30.0),
              alignment: Alignment.bottomCenter,
                child: new Image.network(_url, height: 400, width: 400),
                ),
            new RaisedButton(
              child: Text('Show me an another cat!'),
              onPressed: (){
                setState(() {
                  _url = getNewUrl();
                });
              },
            ),
          ],
        )
      );
  }
}