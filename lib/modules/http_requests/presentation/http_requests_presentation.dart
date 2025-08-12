import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../design_system/app_bar/app_bar.dart';
import '../../../design_system/card/app_card.dart';
import '../../../main.dart';
import '../data/remote/response/country_response.dart';
import '../data/utils/countries_states_helper.dart';
import '../vm/http_requests_view_model.dart';
import 'components/card_country.dart';
import 'components/card_shimmer.dart';

class HttpRequestsPresentation extends StatefulWidget {
  const HttpRequestsPresentation({super.key});

  @override
  State<HttpRequestsPresentation> createState() =>
      _HttpRequestsPresentationState();
}

class _HttpRequestsPresentationState extends State<HttpRequestsPresentation> {
  final vm = inject<HttpRequestsViewModel>();

  final String postUrl =
      'https://medium.com/@mardenmc22/flutter-dio-integra%C3%A7%C3%A3o-de-apis-com-mvvm-054a68251663';

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Flutter com Dio ⚡'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppCard(
              title: 'Flutter + Dio: Integração de APIs com MVVM',
              description: _screenDescription(),
              onTap: () => _launchUrl(postUrl),
            ),
            GFSearchBar(
              searchList: _countriesNames(),
              searchQueryBuilder: (query, list) {
                return _countriesNames()
                    .where(
                      (item) =>
                          item.toLowerCase().contains(query.toLowerCase()),
                    )
                    .toList();
              },
              overlaySearchListItemBuilder: (item) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              },
              onItemSelected: (item) async {
                if (item != null) {
                  final Map<String, dynamic> country = _filterByName(
                    name: item,
                  );

                  await vm.getCountryData(country: country['searchName']);
                }
              },
            ),
            ListenableBuilder(
              listenable: vm,
              builder: (context, asyncSnapshot) {
                if (!vm.isLoading && vm.countryData != null) {
                  final CountryResponse country = vm.countryData!;

                  return CardCountry(
                    image: country.flagPng,
                    altImage: country.flagAlt,
                    countryName: country.nameOfficial,
                    capital: country.capitals,
                    language: country.languages,
                    size: country.area,
                    googleMapsLink: country.googleMapsUrl,
                    openStreetLink: country.openStreetMapsUrl,
                    currency: country.currencies
                        .map((Currency item) => item.name)
                        .toList(),
                    currencySymbol: country.currencies,
                  );
                }

                if (vm.isLoading) {
                  return CardShimmer();
                }

                return Text('Selecione um dos países da lista');
              },
            ),
          ],
        ),
      ),
    );
  }

  String _screenDescription() => """
Aqui você encontra um resumo prático do artigo:
Flutter + Dio: integração de APIs com MVVM, aplicando arquitetura limpa, garantindo escalabilidade e facilitando a manutenção do código.
""";

  List _countriesNames() {
    final countries = CountriesStatesHelper.countries
        .map(
          (Map<String, dynamic> item) => item['name'],
        )
        .toList();

    return countries;
  }

  Map<String, dynamic> _filterByName({required String name}) =>
      CountriesStatesHelper.countries
          .where(
            (Map<String, dynamic> country) => country['name'] == name,
          )
          .first;

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    final ok = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
    if (!ok) throw Exception('Could not launch $uri');
  }
}
