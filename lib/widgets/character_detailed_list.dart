import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/marvel_heroes.dart';
import './character_detailed_item.dart';

class CharacterDetailedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final heroesData = Provider.of<MarvelHeroes>(context, listen: false);
    return ListView.builder(
      itemCount: heroesData.characterSingleList.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: heroesData.characterSingleList[i],
        child: CharacterDetailedItem(),
      ),
    );
  }
}
