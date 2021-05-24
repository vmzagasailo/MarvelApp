import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/marvel_heroes.dart';
import 'character_item.dart';

class CharactersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final heroesData = Provider.of<MarvelHeroes>(context, listen: false);
    final deviceSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Expanded(
          flex: 90,
          child: ListView.builder(
            itemCount: heroesData.charactersList.length,
            itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: heroesData.charactersList[i],
              child: CharacterItem(),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ConstrainedBox(
                  constraints: BoxConstraints(minWidth: deviceSize.width * 0.5),
                  child: TextButton(onPressed: () {}, child: Text('prev'))),
              ConstrainedBox(
                  constraints: BoxConstraints(minWidth: deviceSize.width * 0.5),
                  child: TextButton(onPressed: () {}, child: Text('next'))),
            ],
          ),
        )
      ],
    );
  }
}
