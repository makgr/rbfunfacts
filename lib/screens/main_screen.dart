import 'package:flutter/material.dart';
import 'package:rbfunfacts/screens/setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> facts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RB Fun Facts"),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SettingScreen();
                }));
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.settings),
              )),
        ],
      ),
    );
  }
}
