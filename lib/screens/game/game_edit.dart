import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:guildford_games/models/model_game.dart';
import 'package:http/http.dart' as http;

class EditGame extends StatefulWidget {
  final Game game;
  const EditGame({Key? key, required this.game}):super(key: key);

  @override
  _EditGameState createState() => _EditGameState(
      game: this.game
  );
}

class _EditGameState extends State<EditGame> {
  final Game game;
  TextEditingController _editGameForm_name = TextEditingController();
  TextEditingController _editGameForm_style = TextEditingController();
  TextEditingController _editGameForm_playersMin = TextEditingController();
  TextEditingController _editGameForm_playersMax = TextEditingController();
  TextEditingController _editGameForm_ageMin = TextEditingController();
  TextEditingController _editGameForm_situationLocation = TextEditingController();
  TextEditingController _editGameForm_situationPeople = TextEditingController();
  TextEditingController _editGameForm_storageLocation = TextEditingController();
  TextEditingController _editGameForm_timeMins = TextEditingController();
  TextEditingController _editGameForm_portableYN = TextEditingController();
  TextEditingController _editGameForm_extras = TextEditingController();
  TextEditingController _editGameForm_notes = TextEditingController();
  TextEditingController _editGameForm_picture = TextEditingController();

  _EditGameState({
    required this.game
  });

  final _formKey = GlobalKey<FormState>();
  String formState = "new";
  late Future<Game> _futureGame;
  FocusNode myFocusNode = FocusNode();


  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    print("This is the game: " + this.game.name);

    _editGameForm_name = TextEditingController(text: this.game.name);
    _editGameForm_style = TextEditingController(text: this.game.style);
    _editGameForm_playersMin = TextEditingController(text: this.game.playersMin);
    _editGameForm_playersMax = TextEditingController(text: this.game.playersMax);
    _editGameForm_ageMin = TextEditingController(text: this.game.ageMin);
    _editGameForm_situationLocation = TextEditingController(text: this.game.situationLocation);
    _editGameForm_situationPeople = TextEditingController(text: this.game.situationPeople);
    _editGameForm_storageLocation = TextEditingController(text: this.game.storageLocation);
    _editGameForm_timeMins = TextEditingController(text: this.game.timeMins);
    _editGameForm_portableYN = TextEditingController(text: this.game.portableYN);
    _editGameForm_extras = TextEditingController(text: this.game.extras);
    _editGameForm_notes = TextEditingController(text: this.game.notes);
//    _editGameForm_picture = TextEditingController(text: this.game.pictures);




  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
    print("Focus node dispose");
  }

  Future<Game> updateGame(
      String id,
      String name,
      String style,
      String playersMin,
      String playersMax,
      String ageMin,
      String situationLocation,
      String situationPeople,
      String storageLocation,
      String timeMins,
      String portableYN,
      String extras,
      String notes
      ) async {
    print('Posting Game data! Wish me luck... ');
    final gameJson = jsonEncode(<String, String>{
      'id'                    : id,
      'name'                  : name,
      'style'                 : style,
      'players_min'           : playersMin,
      'players_max'           : playersMax,
      'age_min'               : ageMin,
      'situation_location'    : situationLocation,
      'situation_people'      : situationPeople,
      'storage_location'      : storageLocation,
      'time_mins'             : timeMins,
      'portable_yn'           : portableYN,
      'extras'                : extras,
      'notes'                 : notes
    });
    print(gameJson);
    final response = await http.put(
        Uri.https('iyuebqgqrf.execute-api.eu-west-1.amazonaws.com', 'Prod/catalogue/game'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: gameJson
    );
    print("The result of the PUT attempt was: " + response.statusCode.toString());
    if (response.statusCode == 201) {
      print("response was 201");

      final fullGameJson = jsonEncode(<String, String>{
        'id'                    : id,
        'name'                  : name,
        'style'                 : style,
        'players_min'           : playersMin,
        'players_max'           : playersMax,
        'age_min'               : ageMin,
        'situation_location'    : situationLocation,
        'situation_people'      : situationPeople,
        'storage_location'      : storageLocation,
        'time_mins'             : timeMins,
        'portable_yn'           : portableYN,
        'extras'                : extras,
        'notes'                 : notes
      });

      return Game.fromJSON(jsonDecode(fullGameJson));
    } else {
      throw Exception('Failed to load game');
    }
  }


  @override
  Widget build(BuildContext context) {
    final formPaddingTopBottom = 20.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit a Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (formState == "new")
            ? Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child:ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(15.0),
            children: <Widget>[
              // The first text field is focused on as soon as the app starts.
              Padding(
                padding: EdgeInsets.fromLTRB(0, formPaddingTopBottom, 0, formPaddingTopBottom),
                child:  TextFormField(
                  controller: _editGameForm_name,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Name:',
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please add a name for the game';
                    }
                    return null;
                  },
                  onChanged: (text) {
//                  _formKey.currentState!.validate();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, formPaddingTopBottom, 0, formPaddingTopBottom),
                child:  TextFormField(
                  controller:  _editGameForm_style,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Style:',
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please provide a style for the game';
                    }
                    return null;
                  },
                  onChanged: (text) {
//                  _formKey.currentState!.validate();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, formPaddingTopBottom, 0, formPaddingTopBottom),
                child:  TextFormField(
                  controller:  _editGameForm_playersMin,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Min no of players:',
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please provide the min number of players needed';
                    }
                    return null;
                  },
                  onChanged: (text) {
//                  _formKey.currentState!.validate();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, formPaddingTopBottom, 0, formPaddingTopBottom),
                child:  TextFormField(
                  controller:  _editGameForm_playersMax,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Max no of players:',
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please provide the max number of players that can play';
                    }
                    return null;
                  },
                  onChanged: (text) {
//                  _formKey.currentState!.validate();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, formPaddingTopBottom, 0, formPaddingTopBottom),
                child: TextFormField(
                  controller:  _editGameForm_ageMin,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Min age of players:',
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please provide the minimum age that players need to be to play this game';
                    }
                    return null;
                  },
                  onChanged: (text) {
//                  _formKey.currentState!.validate();
                  },

                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, formPaddingTopBottom, 0, formPaddingTopBottom),
                child: TextFormField(
                  controller:  _editGameForm_situationLocation,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Where is it best to play? e.g. Table',
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please provide the location its best to play - Table / Sofa';
                    }
                    return null;
                  },
                  onChanged: (text) {
//                  _formKey.currentState!.validate();
                  },

                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, formPaddingTopBottom, 0, formPaddingTopBottom),
                child: TextFormField(
//                initialValue: game.situationPeople,
                  controller:  _editGameForm_situationPeople,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Team? Individual?:',
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please provide the game environment - Team / Individual';
                    }
                    return null;
                  },
                  onChanged: (text) {
//                  _formKey.currentState!.validate();
                  },

                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, formPaddingTopBottom, 0, formPaddingTopBottom),
                child: TextFormField(
                  controller:  _editGameForm_storageLocation,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Location in games cupboard:',
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please provide the shelf number of the games cupboard where this game lives';
                    }
                    return null;
                  },
                  onChanged: (text) {
//                  _formKey.currentState!.validate();
                  },

                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, formPaddingTopBottom, 0, formPaddingTopBottom),
                child: TextFormField(
                  controller: _editGameForm_timeMins,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Average playing time (mins):',
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please provide the average amount of time it takes to play this game';
                    }
                    return null;
                  },
                  onChanged: (text) {
//                  _formKey.currentState!.validate();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, formPaddingTopBottom, 0, formPaddingTopBottom),
                child: TextFormField(
                  controller: _editGameForm_portableYN,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Is it portable?:',
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please say if you think this game is portable: Yes / No';
                    }
                    return null;
                  },
                  onChanged: (text) {
                    //                _formKey.currentState!.validate();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, formPaddingTopBottom, 0, formPaddingTopBottom),
                child: TextFormField(
                    controller:  _editGameForm_extras,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Extras: (optional)',
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, formPaddingTopBottom, 0, formPaddingTopBottom),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Notes: (optional)',
                  ),
                  onChanged: (value) {
//                    description = value;
                  },
                  controller: _editGameForm_notes,
                  autofocus: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, formPaddingTopBottom, 0, formPaddingTopBottom),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      formState = "game";
                      _futureGame = updateGame(
                          this.game.id,
                          _editGameForm_name.text,
                          _editGameForm_style.text,
                          _editGameForm_playersMin.text,
                          _editGameForm_playersMax.text,
                          _editGameForm_ageMin.text,
                          _editGameForm_situationLocation.text,
                          _editGameForm_situationPeople.text,
                          _editGameForm_storageLocation.text,
                          _editGameForm_timeMins.text,
                          _editGameForm_portableYN.text,
                          _editGameForm_extras.text,
                          _editGameForm_notes.text
                      );
                    });
                    if (_formKey.currentState!.validate()) {
/*
                   print("1  The name of the game is: "                 + addGameForm_name.text);
                   print("2  The style of the game is: "                + addGameForm_style.text);
                   print("3  The playersMin of the game is: "           + addGameForm_playersMin.text);
                   print("4  The playersMax of the game is: "           + addGameForm_playersMax.text);
                   print("5  The ageMin of the game is: "               + addGameForm_ageMin.text);
                   print("6  The situationLocation of the game is: "    + addGameForm_situationLocation.text);
                   print("7  The situationPeople of the game is: "      + addGameForm_situationPeople.text);
                   print("8  The storageLocation of the game is: "      + addGameForm_storageLocation.text);
                   print("9  The timeMins of the game is: "             + addGameForm_timeMins.text);
                   print("10 The portableYN of the game is: "           + addGameForm_portableYN.text);
                   print("11 The extras of the game is: "               + addGameForm_extras.text);
                   print("12 The notes of the game is: "                + addGameForm_notes.text);
                   print("13 The pictureList of the game is: "          + addGameForm_picture.text);
*/

                    }
                  },
                  child: Text('Update game'),
                ),
              ),
            ],
          ),
        )
            : FutureBuilder<Game>(
          future: _futureGame,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //gamesCatalogue.addGameToCatalogue(snapshot.data!)
              return Text("'" + snapshot.data!.name + "' has been updated");
            } else if (snapshot.hasError) {
              return Text("Doh! Something didn't quite work.... does this help at all?: ${snapshot.error}");
            }

            return Center(
                child: Column(
                    children: [

                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color> (Colors.green),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(16.0),
                          child:Text("Updating the online catalogue...")
                      )
                    ])
            );
          },
        ),
      ),

    );
  }
}