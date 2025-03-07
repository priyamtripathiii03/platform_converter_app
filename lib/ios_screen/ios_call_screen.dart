import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class IosCAllScreen extends StatelessWidget {
  const IosCAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
          child: Column(
              children:List.generate(Provider.of<AddData>(context).listOfPerson.length, (index) => CupertinoListTile(
                leading:ClipOval(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(Provider.of<AddData>(context).listOfPerson[index]['img'])
                        )
                    ),
                  ),
                ),
                title: Text(Provider.of<AddData>(context).listOfPerson[index]['Name']),
                subtitle: Text(Provider.of<AddData>(context).listOfPerson[index]['Num']),
                trailing: Icon(CupertinoIcons.phone),
              )
              )
          ),
        ));
  }
}