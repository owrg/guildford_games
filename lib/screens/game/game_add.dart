import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:guildford_games/models/model_game.dart';
import 'package:http/http.dart' as http;

class AddGame extends StatefulWidget {


  @override
  _AddGameState createState() => _AddGameState();
}

class _AddGameState extends State<AddGame> {
  final _formKey = GlobalKey<FormState>();
  String formState = "new";
  late Future<Game> _futureGame;
  FocusNode myFocusNode = FocusNode();
  final addGameForm_name              = TextEditingController();
  final addGameForm_style             = TextEditingController();
  final addGameForm_playersMin        = TextEditingController();
  final addGameForm_playersMax        = TextEditingController();
  final addGameForm_ageMin            = TextEditingController();
  final addGameForm_situationLocation = TextEditingController();
  final addGameForm_situationPeople   = TextEditingController();
  final addGameForm_storageLocation   = TextEditingController();
  final addGameForm_timeMins          = TextEditingController();
  final addGameForm_portableYN        = TextEditingController();
  final addGameForm_extras            = TextEditingController();
  final addGameForm_notes             = TextEditingController();
  final addGameForm_picture           = TextEditingController();

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
    print("Focus node dispose");
  }



  Future<Game> postNewGame(
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
    final response = await http.post(
        Uri.https('iyuebqgqrf.execute-api.eu-west-1.amazonaws.com', 'Prod/catalogue/game'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: gameJson
    );
    print("The result of the POST attempt was: " + response.statusCode.toString());
    if (response.statusCode == 201) {
      print("response was 201");
      final rbody = jsonDecode(response.body);
      print(rbody);
      print("ID is: " + rbody['id']);
//      print(rbody["Item"]["id"]);

      final fullGameJson = jsonEncode(<String, String>{
        'id'                    : rbody["id"],
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


      //catalog.addGameToCatalogue(
      return Game.fromJSON(jsonDecode(fullGameJson));
    } else {
      throw Exception('Failed to load game');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a Game to the Cupboard'),
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
              TextFormField(
                controller: addGameForm_name,
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
              TextFormField(
                controller: addGameForm_style,
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
              TextFormField(
                controller: addGameForm_playersMin,
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
              TextFormField(
                controller: addGameForm_playersMax,
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
              TextFormField(
                controller: addGameForm_ageMin,
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
              TextFormField(
                controller: addGameForm_situationLocation,
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
              TextFormField(
                controller: addGameForm_situationPeople,
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
              TextFormField(
                controller: addGameForm_storageLocation,
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
              TextFormField(
                controller: addGameForm_timeMins,
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
              TextFormField(
                controller: addGameForm_portableYN,
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
              TextFormField(
                  controller: addGameForm_extras,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Extras: (optional)',
                  )
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  filled: true,
                  hintText: 'Enter a description...',
                  labelText: 'Notes: (optional)',
                ),
                onChanged: (value) {
//                    description = value;
                },
                maxLines: 5,
                controller: addGameForm_notes,
                autofocus: true,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    formState = "game";
                    _futureGame = postNewGame(
                        addGameForm_name.text,
                        addGameForm_style.text,
                        addGameForm_playersMin.text,
                        addGameForm_playersMax.text,
                        addGameForm_ageMin.text,
                        addGameForm_situationLocation.text,
                        addGameForm_situationPeople.text,
                        addGameForm_storageLocation.text,
                        addGameForm_timeMins.text,
                        addGameForm_portableYN.text,
                        addGameForm_extras.text,
                        addGameForm_notes.text
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
                child: Text('Add game'),
              ),
            ],
          ),
        )
            : FutureBuilder<Game>(
          future: _futureGame,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("Game ID: " + snapshot.data!.id);
              return Center(
                  child: Column(
                      children: [
                        Text("'" + snapshot.data!.name + "' is now in the Games Cupboard"),
                        TextButton(
                            child: Text('View game'),
                            onPressed: () => Navigator.of(context).pushReplacementNamed(
                                '/game_details',
                                arguments: snapshot.data!
                            )
                        ),
                      ]
                  )
              );
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
            child:Text("Submitting Game to online catalogue...")
            )
            ])
            );
          },
        ),
      ),

    );
  }
}