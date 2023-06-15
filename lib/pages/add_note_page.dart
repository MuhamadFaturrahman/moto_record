import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_note/extension/date_formater.dart';
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
  late TextEditingController _dateController;

  @override
  void initState() {
    _titleController = TextEditingController();
    _descController = TextEditingController();
    _typeController = TextEditingController();
    _odometerController = TextEditingController();
    _feeController = TextEditingController();
    _dateController = TextEditingController();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _descController.text = widget.note!.description;
      _typeController.text = widget.note!.type;
      _odometerController.text = widget.note!.odometer.toString();
      _feeController.text = widget.note!.serviceFee.toString();
      _dateController.text = widget.note!.createdAt.toSunda();
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
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(color: Color(0xFFCC9B29)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(color: Color(0xFFCC9B29)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(color: Color(0xFFCC9B29)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(color: Color(0xFFCC9B29)),
                      ),
                    ),
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
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(color: Color(0xFFCC9B29)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(color: Color(0xFFCC9B29)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(color: Color(0xFFCC9B29)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(color: Color(0xFFCC9B29)),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(color: Color(0xFFCC9B29)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(color: Color(0xFFCC9B29)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(color: Color(0xFFCC9B29)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(color: Color(0xFFCC9B29)),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(color: Color(0xFFCC9B29)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(color: Color(0xFFCC9B29)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(color: Color(0xFFCC9B29)),
                      ),
                    ),
                  ),
                ),
                if (widget.note != null)
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: TextFormField(
                      keyboardType: TextInputType.datetime,
                      controller: _dateController,
                      validator: (value) {
                        if (value == null || value == "") {
                          return "Please fill the required input";
                        }
                        return null;
                      },
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.timestamp(),
                                firstDate: DateTime(1800),
                                lastDate: DateTime(3000))
                            .then((pickedDate) {
                          _dateController.text = pickedDate.toString();
                        });
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        label: Text("Service Date"),
                        hintText: 'Your Motocycle Service Date',
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide(color: Color(0xFFCC9B29)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide(color: Color(0xFFCC9B29)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide(color: Color(0xFFCC9B29)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide(color: Color(0xFFCC9B29)),
                        ),
                      ),
                    ),
                  ),
                TextFormField(
                  maxLines: 100,
                  controller: _descController,
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Please fill the required input";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Your Motocycle Service Detail',
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(color: Color(0xFFCC9B29)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(color: Color(0xFFCC9B29)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(color: Color(0xFFCC9B29)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(color: Color(0xFFCC9B29)),
                    ),
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
            if (widget.note != null) {
              Note tempNote = Note(
                _titleController.text,
                _descController.text,
                _typeController.text,
                int.parse(_odometerController.text),
                double.parse(_feeController.text),
                DateTime.parse(_dateController.text),
              );
              await dbService.editNote(widget.note!.key, tempNote);
            } else {
              Note tempNote = Note(
                _titleController.text,
                _descController.text,
                _typeController.text,
                int.parse(_odometerController.text),
                double.parse(_feeController.text),
                DateTime.now(),
              );
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
