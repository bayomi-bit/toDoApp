import 'package:flutter/material.dart';

import '../core/database_helper.dart';

class UsersProvider with ChangeNotifier{
  DatabaseHelper db = DatabaseHelper();


    Future initUsers(String name)async{
      await db.insertUser({'name':name});
      notifyListeners();
    }


}