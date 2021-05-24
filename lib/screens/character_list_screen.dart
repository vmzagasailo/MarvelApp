import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/marvel_heroes.dart';

import '../widgets/characters_list.dart';

class CharacterListScreen extends StatefulWidget {
  @override
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      //fetchCharacter(1011334)
      Provider.of<MarvelHeroes>(context).fetchCharactersList().then((_) {
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
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Characters',
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          :  CharactersList(),
    );
  }
}
