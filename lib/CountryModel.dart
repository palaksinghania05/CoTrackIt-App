class Country {
  final String name;
  final int population;
  final int totalCases;
  final int deaths;
  final int recovered;
  final int tests;
  final int active;
  final int critical;
  final String flag;

  Country({this.name, this.population, this.totalCases, this.deaths,
      this.recovered, this.tests, this.active, this.critical, this.flag});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json["country"] as String,
      population: json["population"] as int,
      totalCases: json["cases"] as int,
      deaths: json["deaths"] as int,
      recovered: json["recovered"] as int,
      tests: json["tests"] as int,
      active: json["active"] as int,
      critical: json["critical"] as int,
      flag: json["countryInfo"]["flag"] as String,
    );
  }
}
