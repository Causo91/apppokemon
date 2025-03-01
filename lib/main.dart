import 'package:flutter/material.dart';
import 'package:apppokemon/routes/routes.dart';
import 'package:apppokemon/repositories/pokemon_repository.dart';
import 'package:apppokemon/data_sources/poke_api_data_source.dart'; // Importa el data source

void main() {
  final dataSource = PokeApiDataSource(); // ✅ Crea la instancia del data source
  final repository = PokemonRepository(
    dataSource: dataSource,
  ); // ✅ Pásalo al repositorio

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
