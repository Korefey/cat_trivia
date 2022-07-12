import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cats.g.dart';
@HiveType(typeId: 0)
class Cats {
  @HiveField(0)
  @JsonKey(name: 'id')
  final int id;
  @HiveField(1)
  @JsonKey(name: 'name')
  final String name;
  @HiveField(2)
  @JsonKey(name: 'yeast')
  final String yeast;
  Cats({
    required this.id,
    required this.name,
    required this.yeast
  });

  factory Cats.fromJson(Map<String, dynamic> json) =>
      _$CatsFromJson(json);
}