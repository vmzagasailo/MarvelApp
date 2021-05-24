import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:flutterapp/main.dart';

part 'marvel_hero.g.dart';

@HiveType(typeId: 0)
class MarvelHero with ChangeNotifier {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String imageUrl;
  @HiveField(3)
  final String description;
  @HiveField(4)
  bool isFavorite;

  MarvelHero({
    this.id,
    this.name,
    this.imageUrl,
    this.description,
    this.isFavorite = false,
  });

  void togleFavoriteStatus(int id, String name) {
    Box<MarvelHero> dbBox;
    dbBox = Hive.box<MarvelHero>(hiveBoxName);

    if (!dbBox.containsKey(id)) {
      dbBox.put(id, MarvelHero(name: name));
      isFavorite = true;
    } else {
      dbBox.delete(id);
      isFavorite = false;
    }
    notifyListeners();
  }
}
