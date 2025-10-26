import 'package:flutter/material.dart';
import 'package:my_notes/features/data/model/note_model.dart';

class EditNotePage extends StatefulWidget {
  final NoteModel noteModel;
  final String descr;
  const EditNotePage({super.key, required this.noteModel, required this.descr});

  @override
  State<EditNotePage> createState() => EditNotePageState();
}

class EditNotePageState extends State<EditNotePage> {
  late TextEditingController titleController = TextEditingController();
  late TextEditingController descrController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.noteModel.title);
    descrController = TextEditingController(text: widget.noteModel.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new notes")),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "title",
              ),
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: descrController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "description",
              ),
            ),
            SizedBox(height: 70),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text;
                final descr = descrController.text;
                if (title.isNotEmpty && descr.isNotEmpty) {
                  Navigator.pop(
                    context,
                    NoteModel(title: title, description: descr),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 40),
                backgroundColor: Colors.amber,
              ),
              child: Text("Edit"),
            ),
          ],
        ),
      ),
    );
  }
}
