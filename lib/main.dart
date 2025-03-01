import 'package:flutter/material.dart';
import 'package:apppokemon/routes/routes.dart';
import 'package:apppokemon/repositories/pokemon_repository.dart';
import 'package:apppokemon/data_sources/poke_api_data_source.dart'; 

void main() {
  final dataSource = PokeApiDataSource();
  final repository = PokemonRepository(
    dataSource: dataSource,
  );

  runApp(MainApp(repository: repository));
}

class MainApp extends StatelessWidget {
  final PokemonRepository repository;

  const MainApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.home,
      routes: Routes.getRoutes(repository),
    );
  }
}
