
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/const/colors.dart';
import '../../../core/wideget/clander_view.dart';
import '../../../core/wideget/tasks_list.dart';
import '../../../provider/notes_provider.dart';

class ContentHome extends StatelessWidget {
  const ContentHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NotesProvider>(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            color: ColorsManager.secondaryColor,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Container(
                color: ColorsManager.calnderBackground,
                child: const ClanderView(),
              ),
            ),
          ),
          Center(
              child: noteProvider.note.isEmpty
                  ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/home.png"),
              )
                  : TasksList(noteProvider: noteProvider)),
        ],
      ),
    );
  }
}

