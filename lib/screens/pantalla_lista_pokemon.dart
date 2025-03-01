import 'package:apppokemon/ui/pokemon_card.dart';
import 'package:flutter/material.dart';
import '../repositories/pokemon_repository.dart';
import '../models/pokemon.dart';

class PantallaListaPokemon extends StatefulWidget {
  final PokemonRepository repository;

  const PantallaListaPokemon({super.key, required this.repository});

  @override
  PantallaListaPokemonState createState() => PantallaListaPokemonState();
}

class PantallaListaPokemonState extends State<PantallaListaPokemon> {
  late Future<List<Pokemon>> _pokemonList;

  @override
  void initState() {
    super.initState();
    _cargarPokemons();
  }

  void _cargarPokemons() {
    _pokemonList = widget.repository.getPokemonList(limit: 50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Pokémon'),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: FutureBuilder<List<Pokemon>>(
        future: _pokemonList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar los Pokémon'));
          }

          final pokemons = snapshot.data ?? [];

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: pokemons.length,
            itemBuilder: (context, index) {
              return PokemonCard(pokemon: pokemons[index]);
            },
          );
        },
      ),
    );
  }
}
