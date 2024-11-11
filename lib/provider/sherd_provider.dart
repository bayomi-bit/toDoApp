import 'package:db/core/sherd_pre.dart';
import 'package:flutter/cupertino.dart';

class SherdProvider with ChangeNotifier{

  String? userName;



  Future<void> getName()async {
     String? name = await ShardPreHelper.getName();

    userName ??= name;
    notifyListeners();
  }

}