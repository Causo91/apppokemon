import 'package:flutter/material.dart';
import 'dart:io';

class CustomImageWidget extends StatelessWidget {
  final String imageUrl;

  const CustomImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uri>(
      future: _getImageUri(imageUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Icon(Icons.error);
        } else {
          return Image.network(snapshot.data.toString(), fit: BoxFit.cover);
        }
      },
    );
  }

  Future<Uri> _getImageUri(String url) async {
    HttpClient client = HttpClient();
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    HttpClientResponse response = await request.close();
    return response.redirects.isEmpty
        ? Uri.parse(url)
        : response.redirects.first.location;
  }
}
