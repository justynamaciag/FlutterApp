import 'package:flutter/material.dart';

import 'example_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Filling Demo';
    const color = const Color(0xffe5a9cb);
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: color,
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyForm(),
      ),
    );
  }
}
