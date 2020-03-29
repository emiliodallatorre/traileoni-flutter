import 'package:app/generated/i18n.dart';
import 'package:app/references.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "/homeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex;

  @override
  void initState() {
    _currentIndex = 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: References.appBar(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int newIndex) => setState(()=> _currentIndex = newIndex),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.android), title: Text(S.of(context).home)),
        BottomNavigationBarItem(icon: Icon(Icons.android), title: Text(S.of(context).home)),
        BottomNavigationBarItem(icon: Icon(Icons.android), title: Text(S.of(context).home)),
      ],
    );
  }
}
