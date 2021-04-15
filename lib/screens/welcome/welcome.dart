import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:guildford_games/screens/home/home.dart';
import 'package:guildford_games/models/model_game.dart';
import 'package:guildford_games/models/model_catalog.dart';
import 'package:provider/provider.dart';

class Welcome extends StatefulWidget {

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final GamesCatalogModel gamesCatalogue = GamesCatalogModel();
  late Future<GamesCatalogModel> futureCatalogue;


  void addGamesToCatalogue() async {
    final response = await http.get(Uri.https('iyuebqgqrf.execute-api.eu-west-1.amazonaws.com','Prod/catalogue'));
    if (response.statusCode == 200){
      print('Catalogue Success!');
      var jsondata = jsonDecode(response.body);
        jsondata["Items"].forEach((item) {
          gamesCatalogue.addGameToCatalogue(Game.fromJSON(item));
      });
        print("The size of the games catalogue is: " + gamesCatalogue.getLength().toString());
    } else {
      print("... Doh. Keep trying! You'll get there!!");
      print(response.statusCode);
      return;
    }
  }

 /* Future<GamesCatalogModel> fetchCatalogue() async {
    print(">>>>>>>>>>>>>>>>>>>>>>>");
    print("Welcome: fetchCatalogue.catalog");
    print('Fetching Catalogue data! Wish me luck... ');
    final response = await http.get(Uri.https('iyuebqgqrf.execute-api.eu-west-1.amazonaws.com','Prod/catalogue'));
    if (response.statusCode == 200){
      print('Catalogue Success!');

      var jsondata = jsonDecode(response.body);
      print("There are " + jsondata["Items"].length.toString() + " games in the catalogue");
//      jsondata["Items"].forEach((item) => catalog.addGameToCatalogue(Game.fromJSON(item)));
      jsondata["Items"].forEach((item) {
        print("Loading: " + item['name']);
        //print(item);
        catalog.addGameToCatalogue(Game.fromJSON(item));
      });
      return catalog;
      setState(() {
        var stringResponse = response.body;
      });
    } else {
      print("... Doh. Keep trying! You'll get there!!");
      print(response.statusCode);
      return catalog;
    }
    throw(handleNullThrownErrorException);
  }*/

  @override
  void initState() {
    super.initState();
    addGamesToCatalogue();
/*
    futureCatalogue = fetchCatalogue()
        .catchError((error, stackTrace) {
      print("inner: $error");
*/
      // although `throw SecondError()` has the same effect.
     // return Future.error(handleNullThrownErrorException());
//    });

/*
    futureGame = fetchGame("1")
      .catchError((error, stackTrace) {
      print("inner: $error");
      // although `throw SecondError()` has the same effect.
      return Future.error(handleNullThrownErrorException());
    });
*/
    //print("The selected game is: " + futureGame.name);
  }

  handleNullThrownErrorException(){
    print("Error: handleNullThrownErrorException");
  }


  @override
  Widget build(BuildContext context) {
    final gc = Provider.of<GamesCatalogModel>(context);

    return Scaffold(
        body: Container(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/GuildfordGamesLogoSquare.png"),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pushNamed(
                        '/home',
                        arguments: this.futureCatalogue
                    ),
                    child: Text("Open up the Games Cupboard"),
                  ),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Consumer<GamesCatalogModel>(
                        builder: (context, gc, child) => Text("Downloaded " + gc.getLength().toString() + " games from the online database")
                      ),
                    ),
                  ),

                ],
              )
          ),
        )
    );
  }
}

/*
BuildContext

flutter build apk --split-per-abi
flutter install
*/