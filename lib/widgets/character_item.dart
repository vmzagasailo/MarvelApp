import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/marvel_hero.dart';

import '../screens/character_detailed_screen.dart';

class CharacterItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hero = Provider.of<MarvelHero>(context, listen: false);
    final deviceSize = MediaQuery.of(context).size;
    final paddingTop = MediaQuery.of(context).viewPadding.top;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(CharacterDetailedScreen.routeName, arguments: hero.id);
      },
      child: Container(
        height: (deviceSize.height + paddingTop) * 0.1,
        child: Card(
          elevation: 3,
          margin: EdgeInsets.all(2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: deviceSize.height * 0.15,
                width: deviceSize.height * 0.15,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    topLeft: Radius.circular(4),
                  ),
                ),
                child: Image.network(
                  hero.imageUrl + '.jpg', // + jpg
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    hero.name,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    softWrap: false,
                    textAlign: TextAlign.start,
                    style: TextStyle(),
                    textScaleFactor: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
