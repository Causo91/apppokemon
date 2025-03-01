import 'package:apppokemon/models/pokemon.dart';
import 'package:apppokemon/repositories/pokemon_repository.dart';
import 'package:flutter/material.dart';
import '../screens/pantalla_lista_pokemon.dart';
import '../screens/pantalla_detalles_pokemon.dart';

class Routes {
  static const String home = '/';
  static const String detallesPokemon = '/detalles-pokemon';

  static Map<String, WidgetBuilder> getRoutes(PokemonRepository repository) {
    return {
      home: (_) => PantallaListaPokemon(repository: repository),
      detallesPokemon: (context) {
        final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;
        return PantallaDetallesPokemon(pokemon: pokemon);
      },
    };
  }
}
