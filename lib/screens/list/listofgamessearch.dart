import 'package:flutter/material.dart';
import 'package:guildford_games/models/model_catalog.dart';
import 'package:guildford_games/screens/list/gameitem.dart';
import 'package:guildford_games/screens/game/game_details.dart';

class SearchAppBarRecipe extends StatefulWidget {
  final GamesCatalogModel gc;
  const SearchAppBarRecipe({Key? key, required this.gc}):super(key: key);

  @override
  _SearchAppBarRecipeState createState() => _SearchAppBarRecipeState(
      gc: this.gc
  );
}

class _SearchAppBarRecipeState extends State<SearchAppBarRecipe> {
  final GamesCatalogModel gc;
  final List<String> kWords = GamesCatalogModel.namesList;
  late _SearchAppBarDelegate _searchDelegate;

  //Initializing with sorted list of english words
/*
  _SearchAppBarRecipeState()
      : kWords = GamesCatalogModel.namesList
    ..sort(
          (w1, w2) => w1.toLowerCase().compareTo(w2.toLowerCase()),
    ),
        super();
*/

  _SearchAppBarRecipeState({
    required this.gc
  });

  @override
  void initState() {
    super.initState();
    //Initializing search delegate with sorted list of English words
    _searchDelegate = _SearchAppBarDelegate(kWords);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Search all ' + gc.getLength().toString() + ' Games'),
        actions: <Widget>[
          //Adding the search widget in AppBar
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            //Don't block the main thread
            onPressed: () {
              showSearchPage(context, _searchDelegate);
            },
          ),
        ],
      ),
      body: Scrollbar(
        //Displaying all English words in list in app's main page
        child: ListView.builder(
          itemCount: gc.getLength(),
          itemBuilder: (BuildContext context, int index) {
            return new GameItem(gc.getByIndex(index));
          },

        ),
      ),
    );
  }

  //Shows Search result
  void showSearchPage(BuildContext context, _SearchAppBarDelegate searchDelegate) async {
    final String? selected = await showSearch<String>(
      context: context,
      delegate: searchDelegate,
    );

    if (selected != null) {
      ScaffoldMessenger(
        child:
        SnackBar(
          content: Text('Your Word Choice: $selected'),
        ),
      );
    }
  }
}

//Search delegate
class _SearchAppBarDelegate extends SearchDelegate<String> {
  final List<String> _words;
  final List<String> _history;

  _SearchAppBarDelegate(List<String> words)
      : _words = words,
  //pre-populated history of words
        _history = <String>[],
        super();

  // Setting leading icon for the search bar.
  // Clicking on back arrow will take control to main page
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        //Take control back to previous page
        this.close(context, "null");
      },
    );
  }

  // Builds page to populate search results.
  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('You selected the word:'),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                    '/game_details',
                    arguments: GameDetails(game: GamesCatalogModel.getByName(this.query))
                );
              },
              child: Text(
                this.query,
                style: Theme.of(context)
                    .textTheme
                    .headline1
                !.copyWith(fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Suggestions list while typing search query - this.query.
  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = this.query.isEmpty
        ? _history
        : _words.where((word) => word.toUpperCase().contains(query.toUpperCase()));

    return GamesSuggestionList(
      query: this.query,
      suggestions: suggestions.toList(),
      onSelected: (String suggestion) {
        this.query = suggestion;
        this._history.insert(0, suggestion);

//        showResults(context);
      },
    );
  }

  // Action buttons at the right of search bar.
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      query.isNotEmpty ?
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ) : IconButton(
        icon: const Icon(Icons.mic),
        tooltip: 'Voice input',
        onPressed: () {
          this.query = 'TBW: Get input from voice';
        },

      ),
    ];
  }
}

// Suggestions list widget displayed in the search page.
class GamesSuggestionList extends StatelessWidget {
  const GamesSuggestionList({required this.suggestions,required this.query,required this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.subtitle1;
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty ? Icon(Icons.history) : Icon(null),
          // Highlight the substring that matched the query.
          title: RichText(
            text: TextSpan(
              text: '', //suggestion.substring(0, query.length),
              style: textTheme!.copyWith(fontWeight: FontWeight.normal),
              children: highlightOccurrences(suggestion, query),
            ),
          ),
          onTap: () {

            onSelected(suggestion);
            Navigator.of(context).pushNamed(
              '/game_details',
              arguments: GameDetails(game: GamesCatalogModel.getByName(suggestion)),
            );

          },
        );
      },
    );
  }

  List<TextSpan> highlightOccurrences(String source, String query) {
    if (query == null || query.isEmpty || !source.toLowerCase().contains(query.toLowerCase())) {
      return [ TextSpan(text: source) ];
    }
    final matches = query.toLowerCase().allMatches(source.toLowerCase());

    int lastMatchEnd = 0;

    final List<TextSpan> children = [];
    for (var i = 0; i < matches.length; i++) {
      final match = matches.elementAt(i);

      if (match.start != lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.start),
        ));
      }

      children.add(TextSpan(
        text: source.substring(match.start, match.end),
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ));

      if (i == matches.length - 1 && match.end != source.length) {
        children.add(TextSpan(
          text: source.substring(match.end, source.length),
        ));
      }

      lastMatchEnd = match.end;
    }
    return children;
  }




}







/*


  void myTapCallback(GameItem gameItem) {
    print('user tapped on $gameItem');
  }






class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
final List<String> city_names = [
"Aberdeen",classAurora","Austin","Bakersfield","York",
"Youngstown"....];

final dio = new Dio();
String query = '';

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Search"),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () async {
            final String selected = await showSearch(
                context: context, delegate: _MySearchDelegate(city_names));

            if (selected != null && selected != query) {
              setState(() {
                query = selected;
              });
            }
          },
        )
      ],
    ),
    body: Container(
      child: _buildList(''),
    ),
    resizeToAvoidBottomPadding: false,
  );
}

Widget _buildList(_searchText) {
  final searchItems = query.isEmpty
      ? city_names
      : city_names
      .where((c) => c.toLowerCase().contains(query.toLowerCase()))
      .toList();
  return ListView.builder(
    itemCount: searchItems.length,
    itemBuilder: (BuildContext context, int index) {
      return new ListTile(
        title: Text((searchItems[index])),
        leading: Icon(Icons.location_city),
        subtitle: Text('Search'),
      );
    },
  );
}
}

class _MySearchDelegate extends SearchDelegate<String> {
  final List<String> city_names;

  final List<String> _history = [
    "Aurora",
    "Austin",
    "Bakersfield",
    "Baltimore",
    "Barnstable",
    "Baton Rouge",
    "Beaumont",
    "Bel Air",
    "Bellevue",
    "Berkeley",
    "Bethlehem"
  ];

  List<String> filterName = new List();

  _MySearchDelegate(this.city_names);

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        tooltip: 'Clear',
        icon: const Icon((Icons.clear)),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? _history
        : city_names.where((c) => c.toLowerCase().contains(query)).toList();

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (BuildContext context, int index) {
          return new ListTile(
            title: Text(suggestions[index]),
            onTap: () {
//              showResults(context);
              close(context, suggestions[index]);
            },
          );
        });
  }
}
*/

