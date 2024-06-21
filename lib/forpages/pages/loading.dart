// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:time_for_countries/classes/forclasses.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getLoadingdata() async {
    Allcountries oneCountry = Allcountries(
        countryName: "Egypt", flag: "flag", countryLink: "Africa/Cairo");

    await oneCountry.getData();
    Navigator.pushReplacementNamed(context, '/second', arguments: {
      "time" : oneCountry.timeClock,
      "location": oneCountry.timeZone,
      "amOrpm" : oneCountry.amOrpm
    });
  }

  void initState(){
      super.initState();
    getLoadingdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitPouringHourGlass(
              color: Color.fromARGB(255, 88, 4, 4),
              size: 160.0,
            )
          ],
        ),
      ),
    );
  }
}
