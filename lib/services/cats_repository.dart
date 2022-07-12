import 'package:cat_trivia/models/cats.dart';
import 'package:cat_trivia/services/cats_api_provider.dart';
import 'package:flutter/material.dart';

class CatsRepository{
  final CatsProvider _catsProvider = CatsProvider();
  Future<Cats> getAllCats() => _catsProvider.getCatsInfo();
  Future<Image?> getCatImage() => _catsProvider.getCatsImage();
}