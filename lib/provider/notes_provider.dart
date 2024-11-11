import 'package:db/core/database_helper.dart';
import 'package:flutter/material.dart';

class NotesProvider with ChangeNotifier{
 List<Map<String,dynamic>> note =[];
 DatabaseHelper db =DatabaseHelper();


Future<void> addNote(String title ,String description)async {
 await db.insertNote({
    'title':title,
    'desc':description,
  });
 await fetchNote();
 notifyListeners();

}
Future<void> deleteNote(int id,int index)async{
  await db.deleteNote(id);
  await fetchNote();
  note.removeAt(index);
  notifyListeners();
}

Future<void> fetchNote() async{

    final data = await db.getAllNote();
    note = data;
    notifyListeners();


}








}