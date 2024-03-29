
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pokemon_app/pages/pokemon_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PokemonList(),
    );
  }
}