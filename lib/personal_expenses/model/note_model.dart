import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class NoteModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final int color;
  NoteModel({
    required this.title,
    required this.content,
    required this.color,
  });
}
