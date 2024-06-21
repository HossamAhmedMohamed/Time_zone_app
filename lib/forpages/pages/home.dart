// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map dataReceived = {};
  @override
  Widget build(BuildContext context) {

        dataReceived = dataReceived.isEmpty?
          ModalRoute.of(context)!.settings.arguments as Map
        : dataReceived;
    String img =
        dataReceived["amOrpm"] ? "download.jpg" : "images.jpg";
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/$img"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async{
                   dynamic result = await Navigator.pushNamed(context, '/third', arguments: {});
                   setState( () {
                    if (result == null) {
                        dataReceived = {
                      "time": "...",
                      "location": "Choose location 🙂",
                      "amOrpm": true
                    };
                      } else {
                        dataReceived = {
                      "time": result["time"],
                      "location": result["location"],
                      "amOrpm": result["amOrpm"]
                    };
                      }
                    });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Color.fromARGB(255, 255, 129, 129),
                  size: 29.0,
                ),
                label: Text(
                  "Edit location",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(146, 90, 104, 223)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(22)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                ),
              ),

              SizedBox(
                height: 250,
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 35),
                color: Color.fromARGB(111, 0, 0, 0),
                child: Column(
                  children: [
                    Text(dataReceived["time"], style: TextStyle(
                      fontSize: 55 , color: Colors.white
                    ),),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      dataReceived["location"], style: TextStyle(
                        fontSize: 35 , color: Colors.white
                      ),
                    )
                    
                    ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
