import 'package:flutter/material.dart';
import 'package:guildford_games/models/model_game.dart';
import 'package:guildford_games/models/model_catalog.dart';
import 'package:guildford_games/screens/game/game_details.dart';
import 'package:guildford_games/screens/welcome/welcome.dart';
import 'package:guildford_games/screens/home/home.dart';
import 'package:guildford_games/screens/list/listofgamessearch.dart';
import 'package:guildford_games/screens/game/game_add.dart';
import 'package:guildford_games/screens/game/game_edit.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    print(settings.name);
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Welcome());
      case '/catalog':
        if (args is GamesCatalogModel) {
          return MaterialPageRoute(builder: (_) =>
              SearchAppBarRecipe(
                gc: args,
              ));
        }
        return _errorRoute(args);
      case '/home':
        if (args is GamesCatalogModel) {
          return MaterialPageRoute(builder: (_) =>
              Home(
                gc: args,
              ));
        }
        return _errorRoute(args);
      case '/game_details':
        if (args is Game) {
          return MaterialPageRoute(builder: (_) =>
              GameDetails(
                game: args,
              ));
        }
        return _errorRoute(args);
      case '/game_add':
        return MaterialPageRoute(builder: (_) => AddGame());
      case '/game_edit':
        print(args is Game);
        if (args is Game) {
          return MaterialPageRoute(builder: (_) => EditGame(
            game: args,
          ));
        }
        print(args);
        return _errorRoute(args);
      default:
        return _errorRoute(args);
    }
  }

  static Route<dynamic> _errorRoute(args) {
    print("args: " + args.toString());
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Error:'),
          ),
          body: Center(
              child: Text('Oh dear. There was a navigation routing error. Best get someone to take a look at that!')
          )
      );
    });
  }
}
