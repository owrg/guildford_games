import 'package:flutter/material.dart';

class GamePictureList {
  List<String> pictures;

  GamePictureList(pictures) : this.pictures = pictures ?? <String>[];

  @override
  toString() {
    for(var i=0;i<pictures.length;i++){
      print(pictures[i].toString());
    }
    return "done printing pictures";
  }

  getPictures() {
    for(var i=0;i<pictures.length;i++){
      print(pictures[i].toString());
    }
  }
}