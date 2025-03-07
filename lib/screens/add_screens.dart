import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/image_picker.dart';
import '../provider/provider.dart';

TextEditingController txtName = TextEditingController();
TextEditingController txtNumber = TextEditingController();
TextEditingController txtChat = TextEditingController();

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var imageProvider = Provider.of<ImagePickerProvider>(context);
    var addDataProvider = Provider.of<AddData>(context);

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => imageProvider.pickimg(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: CircleAvatar(
                      child: imageProvider.imagepath == null
                          ? Icon(Icons.add_a_photo_outlined)
                          : null,
                      backgroundImage: imageProvider.imagepath == null
                          ? null
                          : FileImage(imageProvider.imagepath!),
                      maxRadius: 70,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    controller: txtName,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: txtNumber,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
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
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1990),
                          lastDate: DateTime(2050),
                        );
                        if (pickedDate != null) {
                          addDataProvider.pickDate(pickedDate);
                        }
                      },
                      icon: Icon(
                        Icons.date_range,
                        size: 30,
                      ),
                    ),
                    Text(
                      addDataProvider.dateTime == null
                          ? "Pick Date"
                          : "${addDataProvider.dateTime!.day}-${addDataProvider.dateTime!.month}-${addDataProvider.dateTime!.year}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (pickedTime != null) {
                          addDataProvider.pickTime(timeOfDay: pickedTime);
                        }
                      },
                      icon: Icon(
                        Icons.watch_later_outlined,
                        size: 30,
                      ),
                    ),
                    Text(
                      addDataProvider.timeOfDay == null
                          ? "Pick Time"
                          : "${addDataProvider.timeOfDay!.hour}:${addDataProvider.timeOfDay!.minute}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (txtName.text.isNotEmpty &&
                        txtNumber.text.isNotEmpty &&
                        txtChat.text.isNotEmpty) {
                      addDataProvider.addData(context);
                      addDataProvider.resetValue(context: context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Data Saved Successfully')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fill all fields')),
                      );
                    }
                  },
                  child: Text(
                    'SAVE',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
