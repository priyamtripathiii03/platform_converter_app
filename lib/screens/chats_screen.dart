import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import 'add_screens.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(
          child: Column(
              children:List.generate(Provider.of<AddData>(context).listOfPerson.length, (index) => InkWell(
                onTap:() {
                  showBottomSheet(context: context, builder: (context) {
                    return Container(
                      height: 300,
                      width: double.infinity,
                      child: Column(
                        children: [
          
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: CircleAvatar(
                              maxRadius: 60,
                              backgroundImage: FileImage(Provider.of<AddData>(context).listOfPerson[index]['img']),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(onPressed: () {
                                Navigator.pop(context);
                                txtName.text=Provider.of<AddData>(context,listen: false).listOfPerson[index]['Name'];
                                txtNumber.text=Provider.of<AddData>(context,listen: false).listOfPerson[index]['Num'];
                                txtChat.text=Provider.of<AddData>(context,listen: false).listOfPerson[index]['Chat'];
                                showDialog(context: context, builder: (context) => SingleChildScrollView(
                                  child: AlertDialog(
                                    title: Text("Edit"),
                                    actions: [
                                      TextButton(onPressed: () {
                                        Navigator.pop(context);
                                      }, child: Text("Cancel")),TextButton(onPressed: () {
                                        Provider.of<AddData>(context,listen: false).updateList(index);
                                        Navigator.pop(context);
                                      }, child: Text("Save"))
                                    ],
                                    content: SizedBox(
                                      height: 300,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                            child: TextField(
                                              textInputAction: TextInputAction.next,
                                              controller: txtName,
                                              decoration: InputDecoration(
                                                  labelText: 'Full Name',
                                                  prefixIcon: Icon(Icons.person_outline),
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(5))),
                                            ),
                                          ),
                                          TextField(
                                            textInputAction: TextInputAction.next,
                                            controller: txtNumber,
                                            decoration: InputDecoration(
                                                labelText: 'Phone Number',
                                                prefixIcon: Icon(Icons.phone),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(5))),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 15),
                                            child: TextField(
                                              textInputAction: TextInputAction.done,
                                              controller: txtChat,
                                              decoration: InputDecoration(
                                                  labelText: 'Chat Conversation',
                                                  prefixIcon: Icon(Icons.chat_outlined),
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(5))),
                                            ),
                                          ),
                                            
                                        ],
                                      ),
                                    ),
                                  ),
                                ),);
                              }, icon: Icon(Icons.edit)),
          
                              IconButton(onPressed: () {
                                Navigator.pop(context);
                                Provider.of<AddData>(context,listen: false).delete(index);
                              }, icon: Icon(Icons.delete))
                            ],
                          ),
                          OutlinedButton(onPressed: () {
                            Navigator.pop(context);
                          }, child: Text("Cancel"))
                        ],
                      ),
                    );
                  },);
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(Provider.of<AddData>(context).listOfPerson[index]['img']),
                  ),
                  title: Text(Provider.of<AddData>(context).listOfPerson[index]['Name']),
                  subtitle: Text(Provider.of<AddData>(context).listOfPerson[index]['Chat']),
                  trailing: Text("${Provider.of<AddData>(context).listOfPerson[index]['date']+ "," +Provider.of<AddData>(context).listOfPerson[index]['time']}"),
                ),
              ))
          ),
        )
    );
  }
}
