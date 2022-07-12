import 'package:cat_trivia/fact_history/fact_history.dart';
import 'package:cat_trivia/home_page/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic> router(RouteSettings settings) {
  switch (settings.name) {
    case HomePage.routeName:
      return CupertinoPageRoute(builder: (_) => HomePage());
    case FactHistory.routeName:
      return CupertinoPageRoute(builder: (_) => const FactHistory());

    default:
      return CupertinoPageRoute(builder: (_) => HomePage());
  }
}