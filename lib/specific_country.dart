import 'dart:ui';

import 'package:covid_app/country_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailedInfo extends StatelessWidget {
  var countryData;

  DetailedInfo(Country countryData) {
    this.countryData = countryData;
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    print(data.size.height);
    // TODO: implement build
    return CountryData(data, countryData);
  }
}

class CountryData extends StatelessWidget {
  var countryData;
  var data;

  CountryData(MediaQueryData data, Country countryData) {
    this.data = data;
    this.countryData = countryData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black38,
            title: Row(children: [
              Text(countryData.name, style: TextStyle(color: Colors.white)),
              Image(
                width: 50,
                image: NetworkImage(countryData.flag),
              ),
            ])),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://media.istockphoto.com/vectors/black-virus-background-vector-id1214332278?k=6&m=1214332278&s=170667a&w=0&h=RKfTI8PtQonBak8UtkvArJ9DQEqQa3Sqjgf8kYrBwYo="),
                    fit: BoxFit.cover)),
            child: Center(
                child: Container(
                    height: data.size.height - 270,
                    width: data.size.width - 40,
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ListView(children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text("Total cases: ",
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          width: 70,
                        ),
                        Container(
                          height: 50.0,
                          width: 165.0,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Center(
                                child: Text(
                                  countryData.totalCases.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        )
                      ]),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Text("Active cases: ",
                              style: TextStyle(
                                  color: Colors.amberAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            width: 60,
                          ),
                          Container(
                            height: 50.0,
                            width: 160.0,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                  child: Text(
                                    countryData.active.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Text("Critical cases: ",
                              style: TextStyle(
                                  color: Colors.amberAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            width: 55,
                          ),
                          Container(
                            height: 50.0,
                            width: 160.0,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: new Center(
                                  child: new Text(
                                    countryData.critical.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Text("Deaths: ",
                              style: TextStyle(
                                  color: Colors.amberAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            width: 110,
                          ),
                          Container(
                            height: 50.0,
                            width: 160.0,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: new Center(
                                  child: new Text(
                                    countryData.deaths.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Text("Recovered: ",
                              style: TextStyle(
                                  color: Colors.amberAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            width: 77,
                          ),
                          Container(
                            height: 50.0,
                            width: 160.0,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.lime,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: new Center(
                                  child: new Text(
                                    countryData.recovered.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Text("Tests performed: ",
                              style: TextStyle(
                                  color: Colors.amberAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 50.0,
                            width: 160.0,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: new Center(
                                  child: new Text(
                                    countryData.tests.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ])))));
  }
}
