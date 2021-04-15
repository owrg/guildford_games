import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:guildford_games/screens/welcome/welcome.dart';
import 'package:guildford_games/models/model_catalog.dart';
import 'package:guildford_games/utils/route_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(
      ChangeNotifierProvider(
        create: (context) => GamesCatalogModel(),
          child:
         MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guildford Games',
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.yellowAccent,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 4,
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      home: ChangeNotifierProvider(
        create: (_) => new GamesCatalogModel(),
        child: Welcome(),
      )
    );
  }
}