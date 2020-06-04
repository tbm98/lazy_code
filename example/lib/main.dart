import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_code/lazy_code.dart';
import 'second_page.dart';
import 'const.dart';

void main() {
  CodeFasterConfig.setPageRouteType(useMaterial: true);
  runApp(MyApp());
}

const List<dynamic> mainStyle = [mainColor, bold];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.red,
              child: const BoxOfScreen(
                widthPercent: 30,
                heightPercent: 30,
                child: Center(child: Text('hi')),
              ),
            ),
            Container(),
            Text(
              'You have pushed the button this many times:',
              style: styleOf([mainStyle, 11]),
            ),
            // You can create const widget with my custom widget
            const Height(
              50,
              child: FittedBox(child: Text('hi')),
            ),
            // do not use const to create Widget use extension method withs
            // because it still return new Widget
            const Text(
              'You have pushed the button this many times:',
            ).withs([bold, mainColor, 18]),
            // If you want to create const Text
            // you must write code look like below
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: mainColor, fontSize: 18),
            ),
            24.height,
            Text(
              '$_counter',
              style:
                  Theme.of(context).textTheme.headline.withs([16, mainColor]),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            heroTag: '1',
            onPressed: () async {
              // use my extension method
              final a = await context.push((context) => SecondPage());
              print(a);
              // use normal code
              //              await Navigator.of(context)
              //                  .push(CupertinoPageRoute(builder: (context) {
              //                return SecondPage();
              //              }));
            },
            child: Icon(Icons.arrow_forward),
          ),
          FloatingActionButton(
            heroTag: '2',
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
