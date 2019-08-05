import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Weight On Planet X",
    home: new Planet(),
  ));
}

class Planet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return new PlanetState();
  }
}

class PlanetState extends State<Planet> {
  final TextEditingController _weightcontroller = new TextEditingController();
  // ignore: non_constant_identifier_names
  int RadioValue;
   double _finalresult=0.0;
   String _formattedtext;

  void HandleRadioValueChanged(int value) {
    setState(() {
      RadioValue = value;
      print(RadioValue);

      switch(RadioValue){
        case 0 : _finalresult=CalculateWeight(_weightcontroller.text,0.06);
                 _formattedtext = "Your Weight On Pluto is ${_finalresult.toStringAsFixed(2)}";
                  break;
        case 1: _finalresult=CalculateWeight(_weightcontroller.text,0.38);
                 _formattedtext = "Your Weight On Mars is ${_finalresult.toStringAsFixed(2)}";
                  break;
        case 2 : _finalresult=CalculateWeight(_weightcontroller.text,0.91);
                 _formattedtext = "Your Weight On Venus is ${_finalresult.toStringAsFixed(2)}";
                  break;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight On Palnet X"),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      backgroundColor: Colors.white70,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
//            new Image(image: new AssetImage("images/planet.png"),
//              fit: BoxFit.cover,) //this also works
            new Image.asset(
              "images/planet.png",
              height: 150.0,
              width: 200.0,
              color: Colors.deepPurple,
            ),
            new Container(
                margin: const EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: new Column(
                  children: <Widget>[
                    new Padding(padding: const EdgeInsets.all(10.0)),
                    new TextField(
                      controller: _weightcontroller ,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'Your weight on Earth',
                          hintText: 'In Pound',
                          icon: new Icon(Icons.person_outline),
                          fillColor: Colors.white12,
                          filled: true),
                    ),
                    new Padding(padding: const EdgeInsets.all(15.0)),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio<int>(
                            activeColor: Colors.brown,
                            value: 0,
                            groupValue: RadioValue,
                            onChanged: HandleRadioValueChanged),
                        new Text(
                          "Pluto",
                          style: new TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20),
                        ),
                        new Radio<int>(
                            activeColor: Colors.red,
                            value: 1,
                            groupValue: RadioValue,
                            onChanged: HandleRadioValueChanged),
                        new Text(
                          "Mars",
                          style: new TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20),
                        ),
                        new Radio<int>(
                            activeColor: Colors.orange,
                            value: 2,
                            groupValue: RadioValue,
                            onChanged: HandleRadioValueChanged),
                        new Text(
                          "Venus",
                          style: new TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20),
                        ),
                      ],
                    ),
                    new Padding(padding: const EdgeInsets.all(15.0)),
                    new Text(
                     _weightcontroller.text.isEmpty?"Please Enter the Weight":"$_formattedtext lbs",
                      style: new TextStyle(color: Colors.black87, fontSize: 20,),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  double CalculateWeight(String weight, double multiplier) {
    if(int.parse(weight).toString().isNotEmpty && int.parse(weight)>0)
      {
        return int.parse(weight)*multiplier;
      }
    else
       return null;

  }
}
