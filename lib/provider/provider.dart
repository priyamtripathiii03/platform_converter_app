import 'package:flutter/material.dart';
import 'package:platform_converter/provider/image_picker.dart';
import 'package:provider/provider.dart';
import '../screens/add_screens.dart';

class AddData extends ChangeNotifier {
  DateTime? dateTime;
  TimeOfDay? timeOfDay;
  Duration? duration;
  List listOfPerson=[];
  void pickDate(DateTime? dateTime) {
    this.dateTime = dateTime;
    notifyListeners();
  }

  void pickTime({TimeOfDay? timeOfDay, Duration? duration}) {
    this.duration = duration;
    this.timeOfDay = timeOfDay;

    if (duration != null) {
      final int hours = duration.inHours % 24;
      final int minutes = duration.inMinutes % 60;
      this.timeOfDay = TimeOfDay(hour: hours, minute: minutes);
    }
    notifyListeners();
  }

  void addData(context) {
    this.listOfPerson.add({
      'Name': txtName.text,
      'Chat': txtChat.text,
      'Num': txtNumber.text,
      'img': Provider.of<ImagePickerProvider>(context, listen: false).imagepath!,
      'date' : "${dateTime!.day.toString()+"-"+dateTime!.month.toString()+"-"+dateTime!.year.toString()}",
      'time' : "${timeOfDay!.hour.toString() + ":" +timeOfDay!.minute.toString()}"
    });
    notifyListeners();
  }

  void resetValue({required BuildContext context})
  {
    txtName.clear();
    txtNumber.clear();
    txtChat.clear();
    dateTime=null;
    timeOfDay=null;
    Provider.of<ImagePickerProvider>(context, listen: false).imagepath=null;
    notifyListeners();
  }
  Future<void> delete(int index) async {
    await Future.delayed(Duration(milliseconds: 200));
    listOfPerson.removeAt(index);
    notifyListeners();
  }

  void updateList(int index)
  {
    listOfPerson[index]['Name']= txtName.text;
    listOfPerson[index]['Num']=txtNumber.text;
    listOfPerson[index]['Chat']=txtChat.text;
    notifyListeners();
  }


}
