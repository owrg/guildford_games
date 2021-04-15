import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:guildford_games/models/model_catalog.dart';
import 'package:guildford_games/screens/list/gameitem.dart';
import 'package:guildford_games/screens/list/listofgamessearch.dart';
//import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class ListOfGames extends StatelessWidget {
  final GamesCatalogModel gc = new GamesCatalogModel();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('All ' + gc.getLength().toString() + ' Games'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {

                  print('I got clicked');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListOfGames()),
                  );

                },
              ),
            ]
        ),
        body: ListView.builder(
          itemCount: gc.getLength(),
          itemBuilder: (BuildContext context, int index) {
            return new GameItem(gc.getByIndex(index));
          },

        )
    );
  }

  void myTapCallback(GameItem gameItem) {
    print('user tapped on $gameItem');
  }

}
