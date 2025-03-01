import 'dart:io';
import 'package:apppokemon/core/configs/configs.dart';
import 'dart:convert';

class PokeApiDataSource {
  HttpClient _createHttpClient() {
    HttpClient client = HttpClient();
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  }

  Future<Map<String, dynamic>> fetchPokemonList({int limit = 20}) async {
    HttpClient client = _createHttpClient();
    final request = await client.getUrl(
      Uri.parse('${Configs.baseUrl}/pokemon?limit=$limit'),
    );
    final response = await request.close();

    if (response.statusCode == 200) {
      final responseBody = await response.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } else {
      throw Exception('Error al obtener la lista de Pokémon');
    }
  }

  Future<Map<String, dynamic>> fetchPokemonDetail(String name) async {
    HttpClient client = _createHttpClient();
    final request = await client.getUrl(
      Uri.parse('${Configs.baseUrl}/pokemon/$name'),
    );
    final response = await request.close();

    if (response.statusCode == 200) {
      final responseBody = await response.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } else {
      throw Exception('Error al obtener los detalles del Pokémon');
    }
  }
}
