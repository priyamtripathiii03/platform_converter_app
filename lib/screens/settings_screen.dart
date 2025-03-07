import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/change_theme_provider.dart';
import '../provider/image_provider.dart';

TextEditingController txtname = TextEditingController();
TextEditingController txtbio = TextEditingController();

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var imagepath = Provider.of<ImgProvider>(context).imagepath;
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          ListTile(
            leading: Icon(
              Icons.person,
              size: 35,
            ),
            title: Text('Profile',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            subtitle:
            Text('Update Profile Data', style: TextStyle(fontSize: 16)),
            trailing: Switch(
              value: Provider.of<ThemeChange>(context).isContainer,
              onChanged: (value) {
                Provider.of<ThemeChange>(context, listen: false)
                    .container(value);
              },
            ),
          ),
          if (Provider.of<ThemeChange>(context).isContainer)
            Container(
              height: 300,
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: InkWell(
                      onTap: () {
                        Provider.of<ImgProvider>(context, listen: false)
                            .pickimg();
                      },
                      child: CircleAvatar(
                        child: imagepath == null
                            ? Icon(Icons.add_a_photo_outlined)
                            : null,
                        backgroundImage:
                        imagepath == null ? null : FileImage(imagepath),
                        maxRadius: 65,
                      ),
                    ),
                  ),
                  TextField(
                    controller: txtname,
                    decoration: InputDecoration(
                        hintText: "Enter your name..."
                    ),
                  ),
                  TextField(
                    controller: txtbio,
                    decoration: InputDecoration(
                        hintText: "Enter your bio..."
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () {}, child: Text("SAVE")),
                      TextButton(onPressed: () {}, child: Text("CLEAR"))
                    ],
                  ),
                ],
              ),
            ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.wb_sunny_outlined,
              size: 35,
            ),
            title: Text('Theme',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            subtitle: Text("Change Theme", style: TextStyle(fontSize: 16)),
            trailing: Switch(
              value: Provider.of<ThemeChange>(context).isLight,
              onChanged: (value) {
                Provider.of<ThemeChange>(context, listen: false)
                    .changeTheme(value);
              },
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.accessibility),
            title: Text("Accessibility"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.map),
            title: Text("Assisted dialling"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.block),
            title: Text("Blocked numbers"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text("Calling accounts"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.fiber_manual_record_rounded),
            title: Text("Call recording"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("Display options"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.chat_bubble_outline),
            title: Text("Quick responses"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.volume_up),
            title: Text("Sounds and vibration"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.voicemail),
            title: Text("Voicemail"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.chat_bubble_outline),
            title: Text("Contact ringtones"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
