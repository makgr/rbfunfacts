import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/themeProvider.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    var themeprovider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Theme Mode",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Switch(
                  value: themeprovider.isDarkModeChecked,
                  onChanged: (value) {
                    themeprovider.updateMode(darkMode: value);
                  }),
              SizedBox(
                width: 20,
              ),
              Text(
                  themeprovider.isDarkModeChecked ? "Dark Mode" : "Light Mode"),
            ],
          ),
        ],
      ),
    );
  }
}
