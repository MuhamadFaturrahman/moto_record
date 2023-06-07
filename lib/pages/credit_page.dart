import 'package:flutter/material.dart';

class creditPage extends StatelessWidget {
  const creditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Text(
            "Eiusmod dolor aliqua duis occaecat duis minim ex ea ex reprehenderit. Occaecat magna nulla minim nulla magna commodo laboris amet quis irure nisi. Fugiat proident anim consequat elit excepteur."),
      ),
    );
  }
}
