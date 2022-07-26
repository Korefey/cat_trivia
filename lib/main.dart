import 'package:cat_trivia/home_page/home_page.dart';
import 'package:cat_trivia/models/cats.dart';
import 'package:cat_trivia/router.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CatsAdapter());
  runApp(const CatTriviaApp());
}

class CatTriviaApp extends StatelessWidget{
  const CatTriviaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: router,
        home: HomePage(),
    );
  }
}
