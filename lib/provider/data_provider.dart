import 'package:flutter/cupertino.dart';

class DataProvider with ChangeNotifier {
  DateTime focusDate = DateTime.now();

  void changeData(DateTime newData){

    focusDate = newData;
    notifyListeners();

  }

}