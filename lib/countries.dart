import 'package:covid_app/country_request.dart';
import 'package:covid_app/specific_country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Countries extends StatelessWidget {
  final ScrollController _scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text("Countries"),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
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
                        return Card(
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            child: ListTile(
                              title: Text(countryData.name,
                                  style: TextStyle(
                                      color: Colors.lime,
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
                                      builder: (context) =>
                                          DetailedInfo(countryData)),
                                );
                              },
                            ));
                      }));
            }
          },
        ),
      ),
    );
  }
}
