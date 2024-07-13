import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rbfunfacts/providers/themeProvider.dart';
import 'package:rbfunfacts/screens/main_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (contex) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Provider.of<ThemeProvider>(context, listen: false).loadMore();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeprovider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeprovider.isDarkModeChecked
          ? ThemeData.dark(useMaterial3: true)
          : ThemeData.light(useMaterial3: true),
      home: MainScreen(),
    );
  }
}
