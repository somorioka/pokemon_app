import 'package:flutter/material.dart';
import 'package:pokemon_app/models/theme_mode.dart';
import 'package:provider/provider.dart';

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
    return Consumer<ThemeModeNotifier>(
      builder: (context, mode, child) => ListView(
        children: [
           ListTile(
            leading: Icon(Icons.lightbulb),
            title: Text('Dark/Light Mode'),
            trailing: Text((mode.mode == ThemeMode.system)
            ? 'System'
            : (mode.mode == ThemeMode.dark ? 'Dark' : 'Light')),
            onTap: () async {
              var ret = await Navigator.of(context).push<ThemeMode>(
                MaterialPageRoute(
        builder: (context) =>  ThemeModeSelectionPage(init: mode.mode),
        )
        );
        if (ret != null){
          mode.update(ret);
        }
            }
          ),
        ],
      ),
    );
  }
}