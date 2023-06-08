import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:simple_note/extension/date_formater.dart';
import 'package:simple_note/services/database_service.dart';
import 'package:simple_note/util/app_routes.dart';

import '../model/note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseService dbService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Moto Record'),
        actions: [
          Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(Icons.menu));
          })
        ],
      ),
      endDrawer: Drawer(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Builder(builder: (context) {
              return OutlinedButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed('credit');
                  },
                  child: const Text("About Us"));
            }),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).pushNamed('add-note');
        },
        child: const Icon(
          Icons.post_add_rounded,
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box(DatabaseService.boxName).listenable(),
        builder: (context, box, _) {
          if (box.isEmpty) {
            return const Center(
              child: Text("No Record"),
            );
          } else {
            return ListView.separated(
              itemBuilder: (context, index) {
                Note tempNote = box.getAt(index);
                return Dismissible(
                  key: Key(tempNote.key.toString()),
                  confirmDismiss: (DismissDirection direction) async {
                    return await showDialog<bool>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Are you sure you want to delete?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                dbService.deleteNote(tempNote).then(
                                  (_) {
                                    Navigator.pop(context, false);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "${tempNote.title} has been deleted from the record")));
                                  },
                                );
                              },
                              child: const Text('Yes'),
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: NoteCard(
                    note: tempNote,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 8,
                );
              },
              itemCount: box.length,
            );
          }
        },
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.note,
  });
  final Note note;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 3,
      ),
      child: ListTile(
        onTap: () {
          GoRouter.of(context).pushNamed(
            AppRoutes.editNote,
            extra: note,
          );
        },
        title: Text(note.title),
        subtitle: Text(note.description),
        trailing: Text('Dibuat Pada : \n ${note.createdAt.toSunda()}'),
      ),
    );
  }
}
