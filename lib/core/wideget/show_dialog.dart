import 'package:db/core/wideget/text_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/notes_provider.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog( {
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController desController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final noteProvider = Provider.of<NotesProvider>(context);


    return AlertDialog(
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
              style: IconButton.styleFrom(backgroundColor: Colors.white),
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
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      noteProvider.addNote(
                          titleController.text, desController.text);
                      Navigator.pop(context);
                      titleController.clear();
                      desController.clear();
                    }
                  },
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
    );
  }
}
