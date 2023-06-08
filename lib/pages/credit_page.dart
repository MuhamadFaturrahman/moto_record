import 'package:flutter/material.dart';

class CreditPage extends StatelessWidget {
  const CreditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Eiusmod dolor aliqua duis occaecat duis minim ex ea ex reprehenderit. Occaecat magna nulla minim nulla magna commodo laboris amet quis irure nisi. Fugiat proident anim consequat elit excepteur.Occaecat adipisicing incididunt cillum pariatur ad. Quis laboris proident minim veniam elit laboris quis. Sunt consequat aliqua reprehenderit aliqua occaecat ullamco aliquip cillum pariatur reprehenderit irure. Nostrud sit pariatur do et ad proident ullamco Lorem laboris tempor eiusmod nulla. Velit ullamco fugiat eu irure nisi quis nostrud in elit. Elit aliqua consectetur sit velit labore deserunt eu ad aliquip velit et incididunt est.Excepteur officia ex cillum dolor est sit irure consectetur et ex deserunt. Dolor adipisicing minim aliquip consequat in incididunt fugiat duis amet esse duis occaecat in anim. Voluptate dolore sit sint ad fugiat minim duis culpa quis. In in id exercitation amet sit excepteur reprehenderit. Eu eiusmod aliquip nulla ut.",
              textAlign: TextAlign.justify,
            ),
            Card(),
          ],
        ),
      ),
    );
  }
}
