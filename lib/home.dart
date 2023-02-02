import 'package:flutter/material.dart';
import 'package:weather_api/api_class.dart';
import 'package:weather_api/model.dart';

import 'api_class.dart';
import 'model.dart';

class Weatherapi extends StatefulWidget {
  const Weatherapi({Key? key}) : super(key: key);

  @override
  State<Weatherapi> createState() => _WeatherState();
}

class _WeatherState extends State<Weatherapi> {
  String? Country;
  List countryy=[
    "KERALA","LONDON","USA","INDIA","DELHI"
  ];

  conta(String dt, String tm, IconData icn, String temp, Color clr) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: clr,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 1,
                  offset: Offset(0, 3),
                )
              ]),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(dt,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      )),
                  Text(tm,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      )),
                ],
              ),
              Icon(
                icn,
                color: Colors.white,
                size: 50,
              ),
              Text(temp,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  last(String speed, String ms) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white30,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 1,
                  offset: Offset(0, 3),
                )
              ]),
          // color: Colors.white54,
          height: 100,
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(speed,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  )),
              Text(ms,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  WheatherData service = WheatherData();
  Wheather w = new Wheather();

  String c_whether = '';
  double temp = 0;
  double lat = 0;
  double log = 0;
  String im = '';
  @override
  void initState() {
    super.initState();
    getWhether();
  }

  void getWhether() async {
    w = await service.getWhetherData(
        // "Kerala"
        Country.toString() == 'null' ? 'kerala' : Country.toString()

    );
    setState(() {
      c_whether = w.condition;
      temp = w.temperature_c;
      lat = w.temperature_la;
      log = w.temperature_lo;
      im = w.img;
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        toolbarHeight: 50,
        elevation: 0,
      ),
      drawer: Drawer(
        child: Container(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Thursday,June 2019",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60)),
                  Icon(Icons.menu),
                ],
              ),
            ),



            /*Text("KERALA",
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 8)),*/

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        // suffix: IconButton(icon: Icon(Icons.comment_sharp,color: Colors.white,),onPressed: (){},),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.zero),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 3),
                            borderRadius: BorderRadius.zero),
                      ),
                      hint: Text(
                        'Select Country',
                        style: TextStyle(color: Colors.white),
                      ),
                      value: Country,
                      onChanged: (vale) {
                        setState(() {
                          Country = vale.toString();
                          // service.getWhetherData(Country.toString());
                          getWhether();
                        });
                      },
                      items: countryy
                          .map((vale) => DropdownMenuItem(
                          alignment: Alignment.center,
                          value: vale,
                          child: Text(
                            vale,
                            style: TextStyle(fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                letterSpacing: 8),
                          )))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(c_whether.toString(),
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w300,
                color: Colors.white70,
              )),
            ),
            Icon(Icons.cloud,size: 60,color: Colors.white,),

            Text(temp.toString(),
            style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Latitude",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      )),
                ),
                Text(lat.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ],
            ),
            Container(
              color: Colors.white70,
              height: 50,
              width: 2,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Logitude",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      )),
                ),
                Text(log.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ],
            ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
            color: Colors.white54, height: 1, width: double.maxFinite),
            Row(
              children: [
            conta("Thus", "5pm", Icons.thunderstorm_outlined, "28°",
                Colors.green),
            conta(
                "Thus", "5pm", Icons.cloudy_snowing, "28°", Colors.orange),
            conta("Thus", "5pm", Icons.thunderstorm_outlined, "28°",
                Colors.red),
            conta(
                "Thus", "5pm", Icons.cloudy_snowing, "28°", Colors.yellow),
              ],
            ),
            Row(
              children: [
            conta("Thus", "5pm", Icons.thunderstorm_outlined, "28°",
                Colors.grey),
            conta("Thus", "5pm", Icons.cloudy_snowing, "28°",
                Colors.greenAccent),
            conta("Thus", "5pm", Icons.thunderstorm_outlined, "28°",
                Colors.pinkAccent),
            conta(
                "Thus", "5pm", Icons.cloudy_snowing, "28°", Colors.purple),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
            color: Colors.white54, height: 1, width: double.maxFinite),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
            last("Wint Speed", "52m/s"),
            last("SunRise", "5:54pm"),
            last("SunSet", "6:47pm"),
            last("Humidity", "52%"),
              ],
            ),
  ],
      ),
      ),
    );
  }
}
