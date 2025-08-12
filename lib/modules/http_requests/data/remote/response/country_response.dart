class Currency {
  final String code;
  final String name;
  final String symbol;

  Currency({
    required this.code,
    required this.name,
    required this.symbol,
  });

  factory Currency.fromEntry(MapEntry<String, dynamic> e) {
    final v = e.value as Map<String, dynamic>? ?? {};
    return Currency(
      code: e.key,
      name: v['name'] ?? '',
      symbol: v['symbol'] ?? '',
    );
  }
}

class CountryResponse {
  final String flagPng;
  final String flagSvg;
  final String flagAlt;
  final String nameCommon;
  final String nameOfficial;
  final String capital;
  final List<String> languages;
  final double area;
  final String googleMapsUrl;
  final String openStreetMapsUrl;
  final List<Currency> currencies;

  CountryResponse({
    required this.flagPng,
    required this.flagSvg,
    required this.flagAlt,
    required this.nameCommon,
    required this.nameOfficial,
    required this.capital,
    required this.languages,
    required this.area,
    required this.googleMapsUrl,
    required this.openStreetMapsUrl,
    required this.currencies,
  });

  factory CountryResponse.fromJson(Map<String, dynamic> json) {
    final currenciesMap = (json['currencies'] as Map<String, dynamic>?) ?? {};
    final currencies = currenciesMap.entries
        .map((e) => Currency.fromEntry(e))
        .toList();

    return CountryResponse(
      flagPng: json['flags']?['png'] ?? '',
      flagSvg: json['flags']?['svg'] ?? '',
      flagAlt: json['flags']?['alt'] ?? '',
      nameCommon: json['name']?['common'] ?? '',
      nameOfficial: json['name']?['official'] ?? '',
      capital: (json['capital'] != null && json['capital'].isNotEmpty)
          ? json['capital'][0]
          : '',
      languages: json['languages'] != null
          ? (json['languages'] as Map<String, dynamic>).values
                .map((lang) => lang.toString())
                .toList()
          : [],
      area: (json['area'] is int)
          ? (json['area'] as int).toDouble()
          : (json['area'] ?? 0.0),
      googleMapsUrl: json['maps']?['googleMaps'] ?? '',
      openStreetMapsUrl: json['maps']?['openStreetMaps'] ?? '',
      currencies: currencies,
    );
  }

  static List<CountryResponse> fromJsonList(List<dynamic> list) {
    return list.map((item) => CountryResponse.fromJson(item)).toList();
  }

  Currency? get primaryCurrency =>
      currencies.isNotEmpty ? currencies.first : null;
}
