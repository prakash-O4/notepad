import 'package:hive/hive.dart';
part 'fav_model.g.dart';
@HiveType(typeId: 1)
class FavModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final bool isFavorite;
  FavModel({
    required this.content,
    required this.isFavorite,
    required this.title,
  });
}

List<FavModel> favModel = [];
