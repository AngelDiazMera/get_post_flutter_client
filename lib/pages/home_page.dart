import 'package:flutter/material.dart';

import 'home_page_body.dart';

// The page itself
class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: HomePageBody(),
      ),
    );
  }
}
