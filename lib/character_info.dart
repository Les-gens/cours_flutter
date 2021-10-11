import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CharacterInfo extends StatefulWidget {
  const CharacterInfo({Key? key, @required this.character}) : super(key: key);

  final character;

  @override
  _CharacterInfoState createState() => _CharacterInfoState();
}

class _CharacterInfoState extends State<CharacterInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(alignment: Alignment.bottomLeft, children: <Widget>[
            Image(
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                image: NetworkImage(widget.character.image ?? '')),
            Container(
              child: Text(
                widget.character.name.toUpperCase(),
                style: GoogleFonts.architectsDaughter(
                    color: Colors.white, fontSize: 30),
              ),
              color: Colors.black54,
              width: MediaQuery.of(context).size.width,
            ),
          ]),
          Center(
              child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          )),
          _getInfoLine("Status", widget.character.status),
          _getInfoLine("Species", widget.character.species),
          _getInfoLine("Gender", widget.character.gender),
          _getInfoLine("Origin", widget.character.origin.name),
          _getInfoLine("Last location", widget.character.location.name),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget _getInfoLine(String foobar, String description) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            foobar.toUpperCase(),
            style: GoogleFonts.oswald(
                color: Colors.white, fontSize: 20),
          ),
          Text(
            description.toUpperCase(),
            style: GoogleFonts.architectsDaughter(
                color: (description == 'Alive') ? Colors.green: Colors.deepOrange, fontSize: 15),
          )
        ],
      ),
    );
  }
}
