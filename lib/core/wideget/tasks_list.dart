import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../provider/notes_provider.dart';
import '../const/colors.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    super.key,
    required this.noteProvider,
  });

  final NotesProvider noteProvider;

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.noteProvider.note.length,
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
                    widget.noteProvider.note[index]['title'] ?? '',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily:
                        GoogleFonts.poppins().fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    widget.noteProvider.note[index]['desc'] ?? '',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily:
                        GoogleFonts.poppins().fontFamily,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  trailing: IconButton(onPressed: (){
                    widget.noteProvider.deleteNote(widget.noteProvider.note[index]['id'],index);

                    }, icon: Icon(Icons.delete)),
                  // trailing: IconButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       //  isDone = !isDone;
                  //     });
                  //   },
                  //   icon: isDone
                  //       ? Icon(Icons.radio_button_off)
                  //       : Icon(Icons.radio_button_checked),
                  //   color: ColorsManager.primaryColor,
                  // ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}