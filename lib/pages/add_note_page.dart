import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_note/model/note.dart';
import 'package:simple_note/services/database_service.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({
    super.key,
    this.note,
  });
  final Note? note;

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final DatabaseService dbService = DatabaseService();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _descController;
  late TextEditingController _typeController;
  late TextEditingController _odometerController;
  late TextEditingController _feeController;

  @override
  void initState() {
    _titleController = TextEditingController();
    _descController = TextEditingController();
    _typeController = TextEditingController();
    _odometerController = TextEditingController();
    _feeController = TextEditingController();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _descController.text = widget.note!.description;
      _typeController.text = widget.note!.type;
      _odometerController.text = widget.note!.odometer.toString();
      _feeController.text = widget.note!.serviceFee.toString();
    }
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _typeController.dispose();
    _odometerController.dispose();
    _feeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.note != null ? "Edit Note" : "Add New Note",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: TextFormField(
                    controller: _titleController,
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Please fill the required input";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        isDense: true,
                        label: Text("Title"),
                        hintText: 'Type your record title',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide(color: Color(0xFFCC9B29)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide(color: Color(0xFFCC9B29)),
                        )),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: TextFormField(
                    controller: _typeController,
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Please fill the required input";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        isDense: true,
                        label: Text("Motocycle Type"),
                        hintText: 'Your Motocycle Type',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide(color: Color(0xFFCC9B29)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide(color: Color(0xFFCC9B29)),
                        )),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: TextFormField(
                    controller: _odometerController,
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Please fill the required input";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        isDense: true,
                        label: Text("Odometer"),
                        hintText: 'Your Motocycle Odometer',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide(color: Color(0xFFCC9B29)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide(color: Color(0xFFCC9B29)),
                        )),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: TextFormField(
                    controller: _feeController,
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Please fill the required input";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        isDense: true,
                        label: Text("Service Fee"),
                        hintText: 'Your Motocycle Service Fee',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide(color: Color(0xFFCC9B29)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide(color: Color(0xFFCC9B29)),
                        )),
                  ),
                ),
                TextFormField(
                  maxLines: 100,
                  controller: _descController,
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Deskripsi harap diisi";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Tulis Note Anda Disini',
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFFCC9B29),
        foregroundColor: Colors.white,
        onPressed: () async {
          if (_formkey.currentState!.validate()) {
            Note tempNote = Note(
              _titleController.text,
              _descController.text,
              _typeController.text,
              int.parse(_odometerController.text),
              double.parse(_feeController.text),
              DateTime.now(),
            );
            if (widget.note != null) {
              await dbService.editNote(widget.note!.key, tempNote);
            } else {
              await dbService.addNote(tempNote);
            }
            if (!mounted) return;
            GoRouter.of(context).pop();
          }
        },
        label: const Text("Simpan"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
