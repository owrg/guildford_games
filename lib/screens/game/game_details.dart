import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:guildford_games/models/model_game.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GameDetails extends StatelessWidget {
  final Game game;
  GameDetails({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(this.game.name),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.star_border),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('The "Favourite a Game" feature is coming soon!'),
                      )
                  );
                },
              ),
            ]),
        body: ListView(
          children: [
            SizedBox(height: 50),
/*          CarouselSlider(
            options: CarouselOptions(
              height: 300,
              autoPlay: true,
              aspectRatio: 1.0,
            ),
            items: this.game.pictureList.map((item) => Container(
              child: Center(
                  child: Image.network(item, fit: BoxFit.cover, width: 1000)
              ),
            )).toList(),
          ),*/
            DataTable(
              columns: [
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(
                      Text(
                        'Style:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                  ),
                  DataCell(Text(this.game.style)),
                ]),
                DataRow(cells: [
                  DataCell(
                      Text(
                        'No of players:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                  ),
                  DataCell(Text(this.game.getPlayers())),
                ]),
                DataRow(cells: [
                  DataCell(
                      Text(
                        'Min age:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                  ),
                  DataCell(Text(this.game.ageMin.toString() + '+')),
                ]),
                DataRow(cells: [
                  DataCell(
                      Text(
                        'Play time:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                  ),
                  DataCell(Text(this.game.timeMins.toString() + " minutes")),
                ]),
                DataRow(cells: [
                  DataCell(
                      Text(
                        'Where:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                  ),
                  DataCell(Text(this.game.situationLocation)),
                ]),
                DataRow(cells: [
                  DataCell(
                      Text(
                        'People:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                  ),
                  DataCell(Text(this.game.situationPeople)),
                ]),
                DataRow(cells: [
                  DataCell(
                      Text(
                        'Portable:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                  ),
                  DataCell(Text(this.game.portableYN)),
                ]),
                DataRow(cells: [
                  DataCell(
                      Text(
                        'Extras:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                  ),
                  DataCell(Text(this.game.extras)),
                ]),
                DataRow(cells: [
                  DataCell(
                      Text(
                        'Notes:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                  ),
                  DataCell(Text(this.game.notes)),
                ]),
              ],
            ),

          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          // isExtended: true,
            child: Icon(Icons.mode_outlined),
            backgroundColor: Colors.green,
            onPressed: () {
              Navigator.of(context).pushNamed(
                '/game_edit',
                arguments: this.game,
              );
            }
        )
        );
  }
}