import 'package:db/core/sherd_pre.dart';
import 'package:db/features/splash/ui/splash.dart';
import 'package:db/provider/bottom_nav_provider.dart';
import 'package:db/provider/data_provider.dart';
import 'package:db/provider/notes_provider.dart';
import 'package:db/provider/sherd_provider.dart';
import 'package:db/provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await ShardPreHelper.initSharedPre();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>DataProvider()),
      ChangeNotifierProvider(create: (_)=>NotesProvider()),
      ChangeNotifierProvider(create: (_)=>BottomNavProvider()),
      ChangeNotifierProvider(create: (_)=>SherdProvider()),
      ChangeNotifierProvider(create: (_)=>UsersProvider()),
      ],

      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Splash(),
    );
  }
}



