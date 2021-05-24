import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';

import '../providers/marvel_hero.dart';

class CharacterDetailedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hero = Provider.of<MarvelHero>(context, listen: false);
    var dbBox = Hive.box<MarvelHero>('db');
    final deviceSize = MediaQuery.of(context).size;
    final paddingTop = MediaQuery.of(context).viewPadding.top;

    return Container(
      height: deviceSize.height - paddingTop,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.4,
                width: double.infinity,
                child: Image.network(
                  hero.imageUrl + '.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  hero.name,
                  textScaleFactor: 1.25,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  softWrap: false,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Text(hero.description.length < 1
                    ? 'No description'
                    : hero.description),
              ),
            ],
          ),
          Consumer<MarvelHero>(
            builder: (ctx, data, _) => ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: ElevatedButton.icon(
                onPressed: () {
                  data.togleFavoriteStatus(hero.id, hero.name);
                },
                icon: Icon(dbBox.containsKey(hero.id)
                    ? Icons.favorite
                    : Icons.favorite_border),
                label: Text('Mark as favorite'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
