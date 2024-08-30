import 'package:flutter/material.dart';
import 'package:wether_app_tharwat/models/whether_model.dart';

class WhetherBody extends StatelessWidget {
  WhetherBody({super.key, required this.wetherModel});
  final WetherModel wetherModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(43, 74, 118, 175),
          Color.fromARGB(255, 60, 131, 206),
        ])),
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 150, bottom: 50),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            wetherModel.cityName,
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "updated at : ${stringToDateTime(wetherModel.date).hour}:${stringToDateTime(wetherModel.date).minute}",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/images/rainy.png"),
                const Text(
                  "17",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text("MaxTemp : ${wetherModel.maxTemp.round()}"),
                    Text("MinTemp : ${wetherModel.minTemp.round()}"),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              wetherModel.weatherCondition,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

DateTime stringToDateTime(String value) {
  return DateTime.parse(value);
}
