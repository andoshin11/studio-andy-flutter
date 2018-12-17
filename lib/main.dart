import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:studio_andy_app/pages/main.dart';

Future<void> main() async {
  await DotEnv().load('.env');
  runApp(StudioAndy());
}

class StudioAndy extends StatelessWidget {
  StudioAndy();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(254, 254, 254, 1.0),
          accentColor: const Color.fromRGBO(239, 101, 48, 1.0),
          primarySwatch: Colors.orange,
        ),
        home: CupertinoPageScaffold(
          navigationBar: new CupertinoNavigationBar(
            middle: Text('Studio Andy'),
            trailing: Icon(CupertinoIcons.search),
          ),
          child: new MainPage(),
        ));
  }
}
