import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../../../design_system/app_bar/app_bar.dart';
import '../../../main.dart';
import '../data/utils/countries_states_helper.dart';
import '../domain/domain.dart';
import '../vm/http_requests_view_model.dart';

class HttpRequestsPresentation extends StatefulWidget {
  const HttpRequestsPresentation({super.key});

  @override
  State<HttpRequestsPresentation> createState() =>
      _HttpRequestsPresentationState();
}

class _HttpRequestsPresentationState extends State<HttpRequestsPresentation> {
  final service = inject<HttpRequestsServiceInterface>();
  final vm = inject<HttpRequestsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Flutter com Dio ⚡'),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                final Map<String, dynamic> country = _filterByName(name: item);

                await vm.getCountryData(country: country['searchName']);
              },
            ),

            GFButton(
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

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
            (Map<String, dynamic> country) => country['name'] == 'Brasil',
          )
          .first;
}
