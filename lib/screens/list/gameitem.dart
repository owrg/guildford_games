import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:guildford_games/models/model_game.dart';
import 'package:guildford_games/screens/game/game_details.dart';
import 'package:guildford_games/models/model_catalog.dart';

class GameItem extends StatelessWidget {
  final Game game;
  GameItem(this.game);
//    return this.game.pictures.isNotEmpty ? 'assets/images/games/$this.game.pictures': "assets/images/awaitingimage.png";

  @override
  Widget build(BuildContext context) {

    return  TextButton(
        onPressed: () {
          print('User clicked on: '+ this.game.name);
          Navigator.of(context).pushNamed(
            '/game_details',
            arguments: this.game,
          );
        },
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
//              Image.asset(this.game.pictureList[0], width: 120.0, height: 120.0),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          this.game.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 17,
                              fontFamily: 'Roboto',
                              color: Colors.black
                          ),
                        ),
                        Text(
                          this.game.style,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children:[
                              WidgetSpan(
                                child: Icon(
                                  Icons.group,
                                  color: Colors.black,
                                  size: 15.0,
                                ),
                              ),
                              TextSpan(
                                text: '  ' + this.game.getPlayers(),
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        RichText(
                          text: TextSpan(
                            children:[
                              WidgetSpan(
                                child: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                  size: 15.0,
                                ),
                              ),
                              TextSpan(
                                text: '  ' + this.game.ageMin.toString() + ' +',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        RichText(
                          text: TextSpan(
                            children:[
                              WidgetSpan(
                                child: Icon(
                                  Icons.access_time,
                                  color: Colors.black,
                                  size: 15.0,
                                ),
                              ),
                              TextSpan(
                                text: '  ' + this.game.timeMins.toString() + ' mins',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),

                      ]
                  ),
                ),
              ),
            ]
        )
    );
  }
}

