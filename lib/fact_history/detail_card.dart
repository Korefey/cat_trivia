import 'package:cat_trivia/models/cats.dart';
import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final Cats cats;

  const DetailCard({Key? key, required this.cats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Text(
              cats.name,
              maxLines: 2,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(height: 10),
            Text(cats.yeast, maxLines: 2, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
