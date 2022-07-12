import 'dart:convert';
import 'dart:typed_data';

import 'package:cat_trivia/models/cats.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class CatsProvider {
  Future<Cats> getCatsInfo() async {
    final response = await http.get(Uri.parse('https://random-data-api.com/api/beer/random_beer'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> catsJson = json.decode(utf8.decode(response.bodyBytes));
      return Cats.fromJson(catsJson);
    } else {
      throw Exception('Error fetching cats');
    }
  }

  Future<Image?> getCatsImage() async {
    final ByteData imageData = await NetworkAssetBundle(Uri.parse('https://cataas.com/cat')).load('');
    final Uint8List bytes = imageData.buffer.asUint8List();
    return Image.memory(bytes);
  }
}
