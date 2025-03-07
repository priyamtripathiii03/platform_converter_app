import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class IosChatScreeen extends StatelessWidget {
  const IosChatScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: SafeArea(
      child: Column(
        children: List.generate(Provider.of<AddData>(context).listOfPerson.length, (index) => CupertinoListTile(
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
          subtitle: Text(Provider.of<AddData>(context).listOfPerson[index]['Chat']),
          trailing: Text("${Provider.of<AddData>(context).listOfPerson[index]['date']+ "," +Provider.of<AddData>(context).listOfPerson[index]['time']}"),
        )),
      ),
    ));
  }
}
