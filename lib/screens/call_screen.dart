import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children:List.generate(Provider.of<AddData>(context).listOfPerson.length, (index) => ListTile(
            leading: CircleAvatar(
              backgroundImage: FileImage(Provider.of<AddData>(context).listOfPerson[index]['img']),
            ),
            title: Text(Provider.of<AddData>(context).listOfPerson[index]['Name']),
            subtitle: Text(Provider.of<AddData>(context).listOfPerson[index]['Num']),
            trailing: Icon(Icons.phone),
          ))
      ),
    );
  }
}