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

class NativeName {
  final String code;
  final String official;
  final String common;

  NativeName({
    required this.code,
    required this.official,
    required this.common,
  });

  factory NativeName.fromEntry(MapEntry<String, dynamic> e) {
    final v = e.value as Map<String, dynamic>? ?? {};
    return NativeName(
      code: e.key,
      official: v['official'] ?? '',
      common: v['common'] ?? '',
    );
  }
}

class CountryResponse {
  final String flagPng;
  final String flagSvg;
  final String flagAlt;
  final String nameCommon;
  final String nameOfficial;
  final List<NativeName> nativeNames;
  final List<String> capitals;
  final List<String> languages;
  final double area;
  final String googleMapsUrl;
  final String openStreetMapsUrl;
  final List<Currency> currencies;
  final List<String> timezones;

  CountryResponse({
    required this.flagPng,
    required this.flagSvg,
    required this.flagAlt,
    required this.nameCommon,
    required this.nameOfficial,
    required this.nativeNames,
    required this.capitals,
    required this.languages,
    required this.area,
    required this.googleMapsUrl,
    required this.openStreetMapsUrl,
    required this.currencies,
    required this.timezones,
  });

  factory CountryResponse.fromJson(Map<String, dynamic> json) {
    final currenciesMap = (json['currencies'] as Map<String, dynamic>?) ?? {};
    final currencies = currenciesMap.entries
        .map((e) => Currency.fromEntry(e))
        .toList();

    final nativeNamesMap =
        (json['name']?['nativeName'] as Map<String, dynamic>?) ?? {};
    final nativeNames = nativeNamesMap.entries
        .map((e) => NativeName.fromEntry(e))
        .toList();

    final capitals = (json['capital'] as List?)?.cast<String>() ?? [];

    final languages = json['languages'] != null
        ? (json['languages'] as Map<String, dynamic>).values
              .map((lang) => lang.toString())
              .toList()
        : [];

    final timezones = (json['timezones'] as List?)?.cast<String>() ?? [];

    return CountryResponse(
      flagPng: json['flags']?['png'] ?? '',
      flagSvg: json['flags']?['svg'] ?? '',
      flagAlt: json['flags']?['alt'] ?? '',
      nameCommon: json['name']?['common'] ?? '',
      nameOfficial: json['name']?['official'] ?? '',
      nativeNames: nativeNames,
      capitals: capitals,
      languages: languages as List<String>,
      area: (json['area'] is int)
          ? (json['area'] as int).toDouble()
          : (json['area'] ?? 0.0),
      googleMapsUrl: json['maps']?['googleMaps'] ?? '',
      openStreetMapsUrl: json['maps']?['openStreetMaps'] ?? '',
      currencies: currencies,
      timezones: timezones,
    );
  }

  static List<CountryResponse> fromJsonList(List<dynamic> list) {
    return list.map((item) => CountryResponse.fromJson(item)).toList();
  }

  Currency? get primaryCurrency =>
      currencies.isNotEmpty ? currencies.first : null;

  NativeName? get primaryNativeName =>
      nativeNames.isNotEmpty ? nativeNames.first : null;
}
