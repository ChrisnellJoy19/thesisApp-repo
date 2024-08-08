import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          width: 300, // Set the desired width
          height: 300, // Set the desired height
          child: Image(
            image: AssetImage('assets/images/marsu_logo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        Text(
          "UniLock",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontFamily: "Inter",
            fontSize: 50,
            color: Color.fromRGBO(103, 12, 13, 1.000),
          ),
        ),
      ])),
    );
  }
}
