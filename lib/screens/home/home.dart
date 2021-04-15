import 'package:flutter/material.dart';
import 'package:guildford_games/models/model_catalog.dart';
import 'package:guildford_games/screens/list/listofgames.dart';
import 'package:guildford_games/screens/list/listofgamessearch.dart';

class Home extends StatelessWidget {
  final GamesCatalogModel gc;
  Home({Key? key, required this.gc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("The Games Cupboard"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.view_list),
              onPressed: () {
                Navigator.of(context).pushNamed(
                    '/catalog',
                    arguments: this.gc
                );
              }
            ),
          ]
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      image: AssetImage("assets/images/GuildfordGamesLogoSquare.png"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            ListTile(
              leading: Icon(
                  Icons.search
              ),
              title: Text('Search'),
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/catalog',
                  arguments: this.gc,
                );
              },
            ),
            ListTile(
              leading: Icon(
                  Icons.filter_list
              ),
              title: Text('Filter by ...'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('The "Filter by ..." feature is coming soon!'),
                    )
                );
              },
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Manage',
              ),
            ),
            ListTile(
              leading: Icon(
                  Icons.library_add
              ),
              title: Text('Add Game to Library'),
              onTap: () {
                Navigator.pushNamed(context, '/game_add');
/*
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchAppBarRecipe()),
                );
*/
              },
            ),
            ListTile(
              leading: Icon(
                  Icons.star
              ),
              title: Text('Favourites'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('The "View Favourites" feature is coming soon!'),
                    )
                );
/*
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchAppBarRecipe()),
                );
*/
              },
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Developer Notes',
              ),
            ),
            ListTile(
              leading: Icon(
                  Icons.settings
              ),
              title: Text('Version: 0.0.2'),
            ),
            ListTile(
              leading: Icon(
                  Icons.info
              ),
              title: Text('Date: 31 Mar 2021'),
            ),
          ],
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/WallOfGames.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

}



