import 'package:apppokemon/data_sources/poke_api_data_source.dart';

import '../models/pokemon.dart';
import '../models/detalles_pokemon.dart';

class PokemonRepository {
  final PokeApiDataSource dataSource;

  PokemonRepository({required this.dataSource});

  Future<List<Pokemon>> getPokemonList({int limit = 20}) async {
    final data = await dataSource.fetchPokemonList(limit: limit);
    List results = data['results'];

    List<Pokemon> pokemons = await Future.wait(
      results.map((pokemon) async {
        final details = await dataSource.fetchPokemonDetail(pokemon['name']);
        return Pokemon.fromJson(details);
      }),
    );

    return pokemons;
  }

  Future<DetallesPokemon> getPokemonDetail(String name) async {
    final details = await dataSource.fetchPokemonDetail(name);
    return DetallesPokemon.fromJson(details);
  }
}
