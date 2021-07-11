import 'package:covid_app/CountrySearch.dart';
import 'package:covid_app/country_request.dart';
import 'package:covid_app/specific_country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Countries extends StatefulWidget {
  @override
  _Countries createState() => _Countries();
}

class _Countries extends State<Countries> {
  final ScrollController _scroll = ScrollController();

  List<String> _countries;
  List<String> _filteredCountries;

  void getCountryList() async {
    List<Country> countryList = await fetchAllCountries();
    setState(() {
      _countries = countryList.map((item) {
        Country tempObj = new Country(
            item.name,
            item.population,
            item.totalCases,
            item.deaths,
            item.recovered,
            item.tests,
            item.active,
            item.critical,
            item.flag);
        return (tempObj.name);
      }).toList();
      _filteredCountries = _countries;
    });
    print("Countries $_countries");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text("Countries"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: CountrySearch());
              })
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/main_virus.jpg'), fit: BoxFit.cover)),
        child: FutureBuilder(
          future: fetchAllCountries(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Scrollbar(
                  isAlwaysShown: true,
                  controller: _scroll,
                  child: ListView.builder(
                      controller: _scroll,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, item) {
                        final countryData = snapshot.data[item];
                        final population = countryData.population.toString();
                        return _listView(countryData, population, context);
                      }));
            }
          },
        ),
      ),
    );
  }

  _listView(Country countryData, String population, context) {
    return Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100))),
        child: ListTile(
          title: Text(countryData.name,
              style: TextStyle(
                  color: Colors.tealAccent,
                  fontSize: 25,
                  fontWeight: FontWeight.w600)),
          subtitle: Text("Population : $population",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  fontStyle: FontStyle.italic)),
          trailing: Image(
            width: 50,
            image: NetworkImage(countryData.flag),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailedInfo(countryData)),
            );
          },
        ));
  }

/*_search() {
    return Scaffold(
        body: Container(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(hintText: "Enter country name..."),
            onChanged: (text) {
              text = text.toLowerCase();
              setState(() {
                _filteredCountries = countryLists
                    .where((country) => (country
                        .toLowerCase()
                        .contains(text.toLowerCase())))
                    .toList();
              });
            },
          )),
    ));
  }*/
}
