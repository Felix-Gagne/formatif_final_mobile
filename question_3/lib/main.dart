import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'intl_delegate.dart';
import 'intl_localization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // TODO enregistrer les delegate pour la traduction
      localizationsDelegates: [
        DemoDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // TODO annoncer les locales qui sont gerees
      supportedLocales: [
        const Locale('en'),
        const Locale('fr'),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(20),
              child: Text(Locs.of(context).trans("text1"), style: TextStyle(fontSize: 20),),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(Locs.of(context).trans("text2"), style: TextStyle(fontSize: 20),),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(Locs.of(context).trans("text3"), style: TextStyle(fontSize: 20),),
            )
          ],
        ),
      ),
    );
  }
}
