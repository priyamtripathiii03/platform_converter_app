import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/screens/settings_screen.dart';
import 'package:provider/provider.dart';
import '../provider/system_change_provider.dart';
import 'add_screens.dart';
import 'call_screen.dart';
import 'chats_screen.dart';


class AndroidScreen extends StatelessWidget {
  const AndroidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Platform Converter"),
          actions: [
            Switch(
              value: Provider
                  .of<SystemChange>(context)
                  .isIos,
              onChanged: (value) {
                Provider.of<SystemChange>(context, listen: false)
                    .changeSystem(value);
              },
            )
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person_add_alt),),
              Tab(child: Text('CHATS'),),
              Tab(child: Text('CALLS'),),
              Tab(child: Text('SETTING'),)
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AddScreen(),
            ChatScreen(),
            CallScreen(),
            SettingScreen()
          ],
        ),
      ),
    );
  }
}