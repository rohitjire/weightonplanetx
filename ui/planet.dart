import 'package:flutter/material.dart';

class Planet extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PlanetState ();
  }

}

class PlanetState extends State<Planet> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight On Palnet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
    );
  }

}