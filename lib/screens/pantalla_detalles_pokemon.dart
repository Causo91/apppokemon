import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../ui/pokemon_card.dart';

class PantallaDetallesPokemon extends StatelessWidget {
  final Pokemon pokemon;

  const PantallaDetallesPokemon({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name.toUpperCase()),
        backgroundColor: Colors.red,
      ),
      body: Center(child: PokemonCard(pokemon: pokemon, isDetailPage: true)),
    );
  }
}
