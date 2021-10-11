import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/all_characters_response.dart';
import 'package:flutter_application_1/character_info.dart';
import 'package:http/http.dart' as http;

import 'character.dart';
import 'character_info.dart';

class ApiTestScreen extends StatefulWidget {
  const ApiTestScreen({Key? key}) : super(key: key);

  @override
  _ApiTestScreenState createState() => _ApiTestScreenState();
}

class _ApiTestScreenState extends State<ApiTestScreen> {
  String _response = "vide";
  List<Character> _characters = [];

  Future<void> getAllCharacters() async {
    var uri = Uri.parse("https://rickandmortyapi.com/api/character");

    var responseFromApi = await http.get(uri);

    if (responseFromApi.statusCode == 200) {
      setState(() {
        var resp =
            AllCharactersResponse.fromJson(jsonDecode(responseFromApi.body));
        _characters = resp.results ?? [];
      });
    }

    debugPrint(responseFromApi.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => getAllCharacters(), child: const Icon(Icons.search)),
    );
  }

  Widget _getBody() {
    if (_characters.isNotEmpty) {
      return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(_characters[index].name ?? "Vide"),
              leading: Image.network(_characters[index].image ?? ""),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CharacterInfo(character: _characters[index],))
                );
              });
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: _characters.length,
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

}
