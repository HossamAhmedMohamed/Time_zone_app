// ignore_for_file: prefer_const_constructors, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:time_for_countries/classes/forclasses.dart';

class Zone extends StatefulWidget {
  const Zone({super.key});

  @override
  State<Zone> createState() => _ZoneState();
}

class _ZoneState extends State<Zone> {
  List<Allcountries> allCountries = [
    Allcountries(
        countryLink: 'Africa/Cairo',
        countryName: 'Egypt - Cairo',
        flag: 'egypt.png'),
        Allcountries(
        countryLink: 'Asia/Gaza',
        countryName: 'Palastine - Gaza',
        flag: 'palastine.png'),
        
    Allcountries(
        countryLink: 'Africa/Tunis',
        countryName: 'Tunisia - Tunis',
        flag: 'tunisia.png'),
    Allcountries(
        countryLink: 'Africa/Algiers',
        countryName: 'Algeria - Algiers',
        flag: 'algeria.png'),
    Allcountries(
        countryLink: 'Australia/Sydney',
        countryName: 'Australia - Sydney',
        flag: 'australia.png'),
    Allcountries(
        countryLink: 'America/Toronto',
        countryName: 'Canada - Toronto',
        flag: 'canada.png'),
    Allcountries(
        countryLink: 'Asia/Riyadh',
        countryName: '	Saudi Arabia - Riyadh',
        flag: 'sa.png'),
    Allcountries(
        countryLink: 'America/Argentina/San_Luis',
        countryName: '	Argentina - San_luis',
        flag: 'argentina.png'),
        Allcountries(
        countryLink: 'Europe/Berlin',
        countryName: '	Germany - Berlin',
        flag: 'germany.png'),
        Allcountries(
        countryLink: 'Europe/Istanbul',
        countryName: '	Turkey - Istanbul',
        flag: 'turkey.png'),
        Allcountries(
        countryLink: 'Europe/London',
        countryName: '	England - London',
        flag: 'england.png'),
        Allcountries(
        countryLink: 'Europe/Madrid',
        countryName: '	Spain - Madrid',
        flag: 'spain.png'),
        Allcountries(
        countryLink: 'Europe/Moscow',
        countryName: '	Russia - Moscow',
        flag: 'russia.png'),
        Allcountries(
        countryLink: 'Europe/Kyiv',
        countryName: '	Ukraine - Kyiv',
        flag: 'ukranie.png'),
        Allcountries(
        countryLink: 'Europe/Paris',
        countryName: '	France - Paris',
        flag: 'france.png'),
        Allcountries(
        countryLink: 'Europe/Rome',
        countryName: '	Italy - Rome',
        flag: 'italy.png'),
        Allcountries(
        countryLink: 'Asia/Tokyo',
        countryName: '	Japan - Tokyo',
        flag: 'japan.png'),
        Allcountries(
        countryLink: 'Asia/Qatar',
        countryName: '	Qatar - Duha',
        flag: 'qattar.png'),
        Allcountries(
        countryLink: 'America/New_York',
        countryName: '	Usa - New_york',
        flag: 'usa.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 191, 191, 199),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(146, 12, 16, 49),
          title: Text(
            "Choose Location",
            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
          ),
        ),
        body: SizedBox(
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: allCountries.length,
            itemBuilder: (BuildContext context, int index) {
              return (Card(
                  child: ListTile(
                onTap: () async {
                  Allcountries clickedCountry = allCountries[index];

                  await clickedCountry.getData();
                  Navigator.pop(context, {
                    "time" : clickedCountry.timeClock,
                    "location" : clickedCountry.timeZone,
                    "amOrpm" : clickedCountry.amOrpm,
                  });
                },
                title: Text(
                  allCountries[index].countryName,
                  style: TextStyle(fontSize: 25),
                ),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/${allCountries[index].flag}"),
                ),
              )));
            },
          ),
        ));
  }
}
