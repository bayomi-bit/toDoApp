import 'package:flutter/cupertino.dart';

import '../features/home/ui/content_home.dart';
import '../features/profile/ui/profile_screen.dart';

class BottomNavProvider with ChangeNotifier{


  List<Widget> screens = [
    const ContentHome(),
    const ProfileScreen(),
  ];
  int currentIndex = 0;


void onClick(int index){
   currentIndex =index;
   notifyListeners();

}


}