import 'package:flutter/material.dart';
import 'package:sidebar/commons/collapsing_navigation_drawer.dart';
import 'package:sidebar/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: drawerBackgroundColor,
        title: Text('Collapsible Sidebar'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: selectedColor.withOpacity(0.8)
          ),
          CollapsingNavigationDrawer()
        ],
      ),
    );
  }
}
