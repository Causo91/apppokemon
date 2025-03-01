import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../screens/pantalla_detalles_pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final bool isDetailPage;

  const PokemonCard({
    super.key,
    required this.pokemon,
    this.isDetailPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return isDetailPage
        ? _buildDetailContent(context)
        : _buildListTile(context);
  }

  Widget _buildListTile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 3,
        color: Colors.white,
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          leading: Hero(
            tag: pokemon.id,
            child: Image.network(
              pokemon.imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
          ),
          title: Text(
            pokemon.name.toUpperCase(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PantallaDetallesPokemon(pokemon: pokemon),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDetailContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: pokemon.id,
            child: Image.network(
              pokemon.imageUrl,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            pokemon.name.toUpperCase(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children:
                pokemon.types
                    .map(
                      (type) => Chip(
                        label: Text(type),
                        backgroundColor: _getTypeColor(type),
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      case 'grass':
        return Colors.green;
      case 'electric':
        return Colors.yellow.shade700;
      case 'psychic':
        return Colors.purple;
      case 'ice':
        return Colors.cyan;
      case 'dragon':
        return Colors.deepPurple;
      case 'dark':
        return Colors.black87;
      default:
        return Colors.grey;
    }
  }
}
