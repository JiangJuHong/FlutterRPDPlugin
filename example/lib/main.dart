import 'package:flutter/material.dart';

import 'rpd_plugin_example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, Function> methods = {};

  @override
  void initState() {
    super.initState();
    this.methods = {
      "testParam": () => RpdPluginExample.testGetParam()
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: methods.keys
                      .map(
                        (key) => RaisedButton(
                          onPressed: methods[key],
                          child: Text(key),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
