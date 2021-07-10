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

Future fetchAllCountries() async {
  var response =
      await http.get(Uri.parse("https://corona.lmao.ninja/v2/countries"));
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
