import 'package:flutter/material.dart';
import 'package:guildford_games/models/model_game_picture_list.dart';
import 'dart:convert';

class Game {
  final String id;
  final String name;
  final String playersMin;
  final String playersMax;
  final String ageMin;
  final String situationLocation;
  final String situationPeople;
  final String storageLocation;
  final String timeMins;
  final String portableYN;
  final String extras;
  final String style;
  final String notes;
//  final List<dynamic> pictureList;

  Game({
    required this.id,
    required this.name,
    required this.playersMin,
    required this.playersMax,
    required this.ageMin,
    required this.situationLocation,
    required this.situationPeople,
    required this.storageLocation,
    required this.timeMins,
    required this.portableYN,
    required this.extras,
    required this.style,
    required this.notes,
//    required this.pictureList
  });

  factory Game.fromJSON(Map<String, dynamic> json){
    return Game(
      id:                   json['id'],
      name:                 json['name'],
      style:                json['style'],
      playersMin:           json['players_min'],
      playersMax:           json['players_max'],
      ageMin:               json['age_min'],
      situationLocation:    json['situation_location'],
      situationPeople:      json['situation_people'],
      storageLocation:      json['storage_location'],
      timeMins:             json['time_mins'],
      portableYN:           json['portable_yn'],
      extras:               json['extras'],
      notes:                json['notes'],
//      pictureList:          json['pictures']
    );
  }

/*
  @override
  String get hashCode => id;

  @override
  bool operator ==(Object other) => other is Game && other.id == id;
*/

  @override
  String toString(){
    print('id: ' + this.id.toString());
    print('name: ' + this.name);
    print('playersMin: ' + this.playersMin.toString());
    print('playersMax: ' + this.playersMax.toString());
    print('ageMin: ' + this.ageMin.toString());
    print('situationLocation: ' + this.situationLocation);
    print('situationPeople: ' + this.situationPeople);
    print('storageLocation: ' + this.storageLocation.toString());
    print('timeMins: ' + this.timeMins.toString());
    print('portableYN: ' + this.portableYN);
    print('extras: ' + this.extras);
    print('style: ' + this.style);
    print('notes: ' + this.notes);
//    print('pictureList: ' + this.pictureList.toString());

    return "complete";
  }

  String getPlayers(){
    return this.playersMin == this.playersMax ? this.playersMin.toString() + ' players' : this.playersMin.toString() + ' - ' + this.playersMax.toString() + ' players' ;
  }

}