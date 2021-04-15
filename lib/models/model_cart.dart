import 'package:flutter/foundation.dart';
import 'package:guildford_games/models/model_catalog.dart';
import 'package:guildford_games/models/model_game.dart';

class CartModel extends ChangeNotifier {
  /// The private field backing [catalog].
 /* GamesCatalogModel _catalog;

  /// Internal, private state of the cart. Stores the ids of each item.
  final List<int> _gameIds = [];

  /// The current catalog. Used to construct items from numeric ids.
  GamesCatalogModel get catalog => _catalog;

  set catalog(GamesCatalogModel newCatalog) {
    _catalog = newCatalog;
    // Notify listeners, in case the new catalog provides information
    // different from the previous one. For example, availability of an item
    // might have changed.
    notifyListeners();
  }

  /// List of items in the cart.
  List<Game> get games => _gameIds.map((id) => _catalog.getById(id)).toList();

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Game game) {
    _gameIds.add(game.id);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    print('Items in cart: $games');
    notifyListeners();
  }

  void remove(Game game) {
    _gameIds.remove(game.id);
    // Don't forget to tell dependent widgets to rebuild _every time_
    // you change the model.
    notifyListeners();
  }*/
}