import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rbfunfacts/widgets/theme_switcher.dart';

import '../providers/themeProvider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var themeprovider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: Column(
        children: [
          ThemeSwitcher(),
        ],
      ),
    );
  }
}
