
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pokemon_app/controllers/pokemon_list_controller.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de pokemones'),
      ),
      body: _cBodyList(),
    );
  }

  Widget _cBodyList() {
    return GetBuilder<PokemonListController>(
      id: 'pokemon_list',
      init: PokemonListController(),
      builder: (_) => (_.isLoadedList)
      ? SingleChildScrollView(
        child: Column(
          children: _.gPokemonList.map((e) => _cItemPokemon(e)).toList()
        )
      )
      : const Center(child: CircularProgressIndicator())
    );
  }

  Widget _cItemPokemon(Result _pokemon) {
    return GetBuilder<PokemonListController>(
      builder: (_) => ListTile(
        title: Text(_pokemon.name),
        subtitle: Text(_pokemon.url),
        onTap: () => _.tapPokemon(_pokemon),
      ),
    );
  }

}