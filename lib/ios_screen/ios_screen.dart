import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../provider/change_theme_provider.dart';
import '../provider/system_change_provider.dart';
import 'ios_add_screen.dart';
import 'ios_call_screen.dart';
import 'ios_chats_screen.dart';
import 'ios_setting_screen.dart';

class IosScreen extends StatelessWidget {
  const IosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
          brightness: Provider.of<ThemeChange>(context).isLight?Brightness.dark:Brightness.light
      ),
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Platform Converter"),
          trailing: CupertinoSwitch(
            value: Provider.of<SystemChange>(context).isIos,
            onChanged: (value) {
              Provider.of<SystemChange>(context,listen: false).changeSystem(value);
            },
          ),
        ),
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: [
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_add)),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_2)),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone)),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings))
            ],
          ),
          tabBuilder: (context, index) {
            return list[index];
          },
        ),
      ),
    );
  }
}

List list = [
  IosAddDetail(),
  IosChatScreeen(),
  IosCAllScreen(),
  SettingScreenIos()
];