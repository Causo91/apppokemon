import 'pokemon.dart';

class DetallesPokemon {
  final Pokemon pokemon;
  final int height;
  final int weight;
  final List<String> abilities;

  DetallesPokemon({
    required this.pokemon,
    required this.height,
    required this.weight,
    required this.abilities,
  });

  factory DetallesPokemon.fromJson(Map<String, dynamic> json) {
    return DetallesPokemon(
      pokemon: Pokemon.fromJson(json),
      height: json['height'],
      weight: json['weight'],
      abilities:
          (json['abilities'] as List)
              .map((ability) => ability['ability']['name'].toString())
              .toList(),
    );
  }
}
