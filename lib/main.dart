import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    initialiseSearch();
    super.initState();
  }

  List<String> blueRes = [];
  void initialiseSearch() async {
    await FlutterBluePlus.turnOn();
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 4))
        .then((_) => FlutterBluePlus.scanResults.listen((results) {
              print(results);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
