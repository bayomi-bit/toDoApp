import 'package:db/core/const/colors.dart';
import 'package:db/core/database_helper.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/wideget/text_form.dart';
import '../../profile/ui/profile_screen.dart';

List<Map<String, dynamic>> note = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DatabaseHelper db = DatabaseHelper();
  List<Widget> screen = [
    const MyHome(),
    const ProfileScreen(),
  ];
  int currentIndex = 0;

  Future fetchNotes() async {
    final data = await db.getAllNote();
    setState(() {
      note = data;
    });
  }

  Future onAddTask() async {
    if (formKey.currentState!.validate()) {
      await db.insertNote({
        'title': titleController.text,
        'desc': desController.text,
      });

      await fetchNotes();
      Navigator.pop(context);
      titleController.clear();
      desController.clear();
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsManager.secondaryColor,
        title: Center(
          child: Text(
            "Today",
            style: TextStyle(
                color: Colors.black,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            print('Current index: $currentIndex');
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAlertDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  void showAlertDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              insetPadding: EdgeInsets.zero,
              backgroundColor: const Color(0xffF4D8F9),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      "New Task",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 160,
                  ),
                  IconButton(
                      onPressed: () {},
                      style:
                          IconButton.styleFrom(backgroundColor: Colors.white),
                      icon: const Icon(Icons.cancel_sharp))
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    key: formKey,
                    child: SizedBox(
                      width: 345,
                      child: TextForm(
                        controller: titleController,
                        lable: "Title",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextForm(
                    controller: desController,
                    lable: "description",
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Center(
                    child: SizedBox(
                      width: 135,
                      height: 33,
                      child: TextButton(
                          onPressed: onAddTask,
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 15,
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              )),
                          child: const Text(
                            "Add",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}

class MyHome extends StatefulWidget {
  const MyHome({
    super.key,
  });

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool isDone = false;
  var _focusDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            color: ColorsManager.secondaryColor,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Container(
                color: ColorsManager.secondaryColor,
                child: EasyInfiniteDateTimeLine(
                  dayProps: const EasyDayProps(
                    dayStructure: DayStructure.dayNumDayStr,
                    inactiveDayStyle: DayStyle(
                        dayNumStyle: TextStyle(
                      fontSize: 18.0,
                    )),
                    activeDayStyle: DayStyle(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.center,
                          colors: [
                            ColorsManager.primaryColor,
                            ColorsManager.primaryColor,
                          ],
                        ),
                      ),
                      dayNumStyle: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    width: 48.0,
                    height: 68,
                  ),
                  activeColor: ColorsManager.primaryColor,
                  firstDate: DateTime(2023),
                  focusDate: _focusDate,
                  lastDate: DateTime.now(),
                  onDateChange: (selectedDate) {
                    setState(() {
                      _focusDate = selectedDate;
                    });
                  },
                ),
              ),
            ),
          ),
          Center(
              child: note.isEmpty
                  ? Image.asset("assets/home.png")
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: note.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: ColorsManager.secondaryColor,
                                ),
                                child: ListTile(
                                  title: Text(
                                    note[index]['title'] ?? '',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    note[index]['desc'] ?? '',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        //  isDone = !isDone;
                                      });
                                    },
                                    icon: isDone
                                        ? Icon(Icons.radio_button_off)
                                        : Icon(Icons.radio_button_checked),
                                    color: ColorsManager.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )),
        ],
      ),
    );
  }
}
