import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'feed.dart';

class InstaHomeView extends StatefulWidget {
  const InstaHomeView({super.key});

  @override
  _InstaHomeViewState createState() => _InstaHomeViewState();

}

class _InstaHomeViewState extends State<InstaHomeView> {
  var _pages = [
    Feed(),
    Feed(),
    Feed(),
    Feed(),
    Feed(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),


      body: _pages[currentPage],

    );
  }
}
