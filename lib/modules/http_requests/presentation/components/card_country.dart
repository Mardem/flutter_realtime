import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:url_launcher/url_launcher.dart';

class CardCountry extends StatelessWidget {
  const CardCountry({
    super.key,
    required this.image,
    required this.altImage,
    required this.countryName,
    required this.capital,
    required this.language,
    required this.size,
    required this.googleMapsLink,
    required this.openStreetLink,
  });

  final String image;
  final String altImage;
  final String countryName;
  final List<String> capital;
  final String language;
  final double size;

  final String googleMapsLink;
  final String openStreetLink;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      hint: altImage,
      child: GFCard(
        boxFit: BoxFit.cover,
        color: const Color.fromRGBO(40, 44, 52, 1),
        image: Image.network(image),
        showImage: true,
        title: GFListTile(
          title: Text(
            countryName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subTitle: Text(
            '🏛️ Capital: ${capital.join(', ')}',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '🗣️ Linguas: $language',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                '🌍 Tamanho geográfico: $size',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        buttonBar: GFButtonBar(
          children: <Widget>[
            GFButton(
              text: 'Google Maps',
              icon: Icon(
                Icons.map,
                color: Colors.white,
              ),
              onPressed: () => _launchUrl(googleMapsLink),
            ),
            GFButton(
              text: 'OpenStreet Maps',
              icon: Icon(
                Icons.map,
                color: Colors.white,
              ),
              onPressed: () => _launchUrl(openStreetLink),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    final ok = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
    if (!ok) throw Exception('Could not launch $uri');
  }
}
