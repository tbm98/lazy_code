import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazy_code/lazy_code.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second page'),
        ),
        body: Center(
          child: RaisedButton(
              onPressed: () {
                context.pop(['hihi']);
              },
              child: const Text('back')),
        ));
  }
}
