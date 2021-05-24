import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/marvel_heroes.dart';

import '../widgets/character_detailed_list.dart';

class CharacterDetailedScreen extends StatefulWidget {
  static const routeName = '/detailed-screen';
  @override
  _CharacterDetailedScreenState createState() =>
      _CharacterDetailedScreenState();
}

class _CharacterDetailedScreenState extends State<CharacterDetailedScreen> {
  var _isInit = true;
  var _isLoading = false;
  int heroId;

  @override
  void didChangeDependencies() {
    heroId = ModalRoute.of(context).settings.arguments;
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      //fetchCharacter(1011334)
      Provider.of<MarvelHeroes>(context).fetchCharacterById(heroId).then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : CharacterDetailedList(),
    );
  }
}
