
import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/models/pokemon_detail_model.dart';


class PokemonDetailController extends GetxController {

  late final String _urlDetail;
  bool _isLoadedDetail = false;
  late final List<PokemonDetail> _pokemonDetail;

  bool get isLoadedDetail => _isLoadedDetail;
  List<PokemonDetail>  get gPokemonDetail => _pokemonDetail;

  @override
  void onReady() {
    _urlDetail = Get.arguments;
    getPokemonDetail();
    super.onReady();
  }

  void getPokemonDetail() async {
    try {
      var _resp = await http.get(Uri.parse(_urlDetail));
      _pokemonDetail = pokemonDetailFromJson(jsonEncode(jsonDecode(_resp.body)['stats']));
      _isLoadedDetail = true;
      update(['pokemon_detail']);
    } catch (e) {
      print(e);
    }
  }
  
}