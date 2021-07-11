import 'dart:convert';
import 'package:http/http.dart' as http;

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

  Country(this.name, this.population, this.totalCases, this.deaths,
      this.recovered, this.tests, this.active, this.critical, this.flag);
}

Future<List<Country>> fetchAllCountries() async {
  var response = await http
      .get(Uri.parse("https://corona.lmao.ninja/v3/covid-19/countries"));
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    List<Country> countries = [];
    for (var element in jsonData) {
      Country country = Country(
          element["country"],
          element["population"],
          element["cases"],
          element["deaths"],
          element["recovered"],
          element["tests"],
          element["active"],
          element["critical"],
          element["countryInfo"]["flag"]);
      countries.add(country);
    }
    print(countries.length);
    return countries;
  } else
    throw Exception("Failed to load countries!!");
}

Future<Map> getData(String country) async {
  final Uri url = Uri.https("disease.sh", "/v3/covid-19/countries",
      {"country": country, "strict": true});
  http.Response response = await http.get(url);
  Map<String, dynamic> countryData = {};
  if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    countryData.putIfAbsent("name", () => body["country"]);
    countryData.putIfAbsent("population", () => body["population"]);
    countryData.putIfAbsent("active", () => body["active"]);
    countryData.putIfAbsent("deaths", () => body["deaths"]);
    countryData.putIfAbsent("recovered", () => body["recovered"]);
    countryData.putIfAbsent("critical", () => body["critical"]);
    countryData.putIfAbsent("flag", () => body["countryInfo"]["flag"]);
    countryData.putIfAbsent("tests", () => body["tests"]);
    countryData.putIfAbsent("total", () => body["cases"]);
    return countryData;
  }
}

/*Country _convert(json) {
  final name = json["country"];
  final population = json["population"];
  final active = json["active"];
  final recovered = json["recovered"];
  final deaths = json["deaths"];
  final totalCases = json["cases"];
  final critical = json["critical"];
  final tests = json["tests"];
  final flag = json["countryInfo"].fifth("flag");
  return Country(name, population, totalCases, deaths, recovered, tests, active,
      critical, flag);
}*/
