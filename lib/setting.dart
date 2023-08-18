import 'package:flutter/material.dart';

import 'theme_mode_select.dart';
import 'utils/store_data.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
         ListTile(
          leading: Icon(Icons.lightbulb),
          title: Text('Dark/Light Mode'),
          trailing: Text((_themeMode == ThemeMode.system)
          ? 'System'
          : (_themeMode == ThemeMode.dark ? 'Dark' : 'Light')),
          onTap: () async {
            var ret = await Navigator.of(context).push<ThemeMode>(
              MaterialPageRoute(
      builder: (context) =>  ThemeModeSelectionPage(mode: _themeMode),
      )
      );
     setState(() => _themeMode = ret!);
     await saveThemeMode(_themeMode);
          }
        ),
      ],
    );
  }
}