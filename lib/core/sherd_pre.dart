import 'package:shared_preferences/shared_preferences.dart';

class ShardPreHelper {
  static late SharedPreferences prefs;
  static const userName = 'userName';
  static const isLoginIn = 'isLogin';

  static Future initSharedPre() async {
    prefs = await SharedPreferences.getInstance();
  }
  static Future setName(String name) async {
   await prefs.setString(userName, name);


  }
  static Future<String?>getName()async{
    return await prefs.getString(userName);
  }
  static Future removeName()async{
    await prefs.remove(userName);
  }
  static Future setIsLogin(bool isLogin)async{
    await prefs.setBool(isLoginIn, isLogin);
  }
  static Future<bool?>getIsLogin()async{
    return await prefs.getBool(isLoginIn);
  }
  static Future removeIsLogin()async{
    await prefs.remove(isLoginIn);
  }




}