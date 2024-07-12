import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rbfunfacts/screens/setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<dynamic> facts = [];
  bool isLoading = true;

  //api url
  //https://raw.githubusercontent.com/makgr/rbfunfacts/main/fun_facts.json

  void getData() async {
    try {
      Response response = await Dio().get(
          "https://raw.githubusercontent.com/makgr/rbfunfacts/main/fun_facts.json");

      facts = jsonDecode(response.data);
      isLoading = false;
      setState(() {});
    } catch (e) {
      isLoading = false;
      print(e);
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

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
      body: Column(
        children: [
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : PageView.builder(
                    itemCount: facts.length,
                    itemBuilder: (BuildContext contex, int index) {
                      return Container(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              facts[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 35),
                            ),
                          ),
                        ),
                      );
                    }),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Swipe left for more."),
            ),
          )
        ],
      ),
    );
  }
}
