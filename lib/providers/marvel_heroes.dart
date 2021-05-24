import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

import 'marvel_hero.dart';

class MarvelHeroes with ChangeNotifier {
  List<MarvelHero> _characterById = [];
  List<MarvelHero> _charactersList = [];

  List<MarvelHero> get charactersList {
    return [..._charactersList];
  }

  List<MarvelHero> get characterSingleList {
    return [..._characterById];
  }

  MarvelHero findById(int id) {
    return _characterById.firstWhere((val) => val.id == id,
        orElse: () => null);
  }

  String genereteMd5(String str) {
    return md5.convert(ascii.encode(str)).toString();
  }

  var publickKey = 'Publick-Key';
  var privateKey = 'Private-Key';

  Future<void> fetchCharactersList() async {
    Random random = Random();
    int ts = random.nextInt(100);

    var md5String = '$ts$privateKey$publickKey';
    var generetedMd5 = genereteMd5(md5String);
    var url = Uri.parse(
        'https://gateway.marvel.com/v1/public/characters?ts=$ts&apikey=$publickKey&hash=$generetedMd5&orderBy=name');

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<MarvelHero> loadedCharacters = [];
      extractedData.forEach((i, data) {
        if (i == 'data') {
          (data['results'] as List<dynamic>).forEach((val) {
            loadedCharacters.add(MarvelHero(
              id: val['id'],
              name: val['name'],
              imageUrl: val['thumbnail']['path'],
            ));
          });
        }
      });
      _charactersList = loadedCharacters;

      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> fetchCharacterById(int id) async {
    Random random = Random();
    int ts = random.nextInt(100);

    var md5String = '$ts$privateKey$publickKey';
    var generetedMd5 = genereteMd5(md5String);

    var url = Uri.parse(
        'https://gateway.marvel.com/v1/public/characters?ts=$ts&apikey=$publickKey&hash=$generetedMd5&id=$id');

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<MarvelHero> loadedCharacters = [];
      extractedData.forEach((i, data) {
        if (i == 'data') {
          (data['results'] as List<dynamic>).forEach((val) {
            loadedCharacters.add(MarvelHero(
              id: val['id'],
              name: val['name'],
              imageUrl: val['thumbnail']['path'],
              description: val['description'],
            ));
          });
        }
      });
      _characterById = loadedCharacters;
      notifyListeners();
    } catch (error) {
      print(error);
      return error;
    }
  }

}
