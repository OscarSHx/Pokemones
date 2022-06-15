
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pokemon_app/controllers/pokemon_detail_controller.dart';

class PokemonDetail extends StatelessWidget {
  const PokemonDetail({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PokemonDetailController>(
      init: PokemonDetailController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Detalles de Pokemon'),
        ),
        body: _cBodyDetail(),
      ),
    );
  }

  Widget _cBodyDetail() {
    return GetBuilder<PokemonDetailController>(
      id: 'pokemon_detail',
      builder: (_) => (_.isLoadedDetail)
      ? _cContPokemonDetail()
      : const Center(child: CircularProgressIndicator())
    );
  }

  Widget _cContPokemonDetail() {
    return GetBuilder<PokemonDetailController>(
      builder: (_) => Center(
        child: Column(
          children: _.gPokemonDetail.map(
            (e) => IntrinsicWidth(
              child: Row(
                children: [
                  Text(
                    e.stat.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(width: 50.0),
                  Text(
                    '${e.baseStat}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  )
                ]
              ),
            )
          ).toList()
        ),
      )
    );
  }

}