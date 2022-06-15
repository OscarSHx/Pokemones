
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pokemon_app/models/pokemon_list_model.dart';
import 'package:pokemon_app/pages/pokemon_detail_page.dart';
export 'package:pokemon_app/models/pokemon_list_model.dart';

class PokemonListController extends GetxController {
  
  //jorge.zaragoza@ikontechnologies.com 
  
  bool _isLoadedList = false;
  late final PokemonList _pokemonList;

  bool get isLoadedList => _isLoadedList;
  List<Result> get gPokemonList => _pokemonList.results;

  @override
  void onReady() {
    getPokemonList();
    super.onReady();
  }

  void getPokemonList() async {
    try {
      var _resp = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/'));
      _pokemonList = pokemonListFromJson(_resp.body);
      _isLoadedList = true;
      update(['pokemon_list']);
    } catch (e) {
      print(e);
    }
  }

  void tapPokemon(Result _pokemonSelected) => Get.to( () => const PokemonDetail(), arguments: _pokemonSelected.url);


}