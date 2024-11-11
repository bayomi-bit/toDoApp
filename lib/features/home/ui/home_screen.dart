import 'package:db/core/const/colors.dart';
import 'package:db/core/sherd_pre.dart';
import 'package:db/features/login/ui/login_screen.dart';
import 'package:db/provider/bottom_nav_provider.dart';
import 'package:db/provider/notes_provider.dart';
import 'package:db/provider/sherd_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/wideget/show_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NotesProvider>(context, listen: false).fetchNote();
      Provider.of<SherdProvider>(context, listen: false).getName();
    });
  }

  @override
  Widget build(BuildContext context) {
    final shardProvider = Provider.of<SherdProvider>(context);
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);
    int currentIndex = bottomNavProvider.currentIndex;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsManager.secondaryColor,
        title: Text(
          'Welcome  ${shardProvider.userName}',
          style: TextStyle(
              color: Colors.black,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                ShardPreHelper.setIsLogin(false);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
              icon: const Icon(Icons.login))
        ],
      ),
      body: bottomNavProvider.screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          bottomNavProvider.onClick(index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: ShowDialog(),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
