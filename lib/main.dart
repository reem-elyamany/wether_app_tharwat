import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app_tharwat/Cubits/getWeatherCubit/get_weather_cubit.dart';

import 'package:wether_app_tharwat/screens/home_page.dart';

import 'screens/Search_page.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: MaterialApp(
        // theme: ThemeData(
        //   primarySwatch: getThemColor(BlocProvider.of<GetWeatherCubit>(context).)
        // ),
        home: HomePage(),
      ),
    );
  }
  // MaterialColor getThemColor(String condtion){
  // if (condtion=='Sunny'||condtion=="Clear")
  // {
  //   return Colors.orange;
  // }
  // else if(condtion=="Heavy snow")
  // {
  //   return Colors.lightBlue;
  // }
  // else if(condtion== "Cloudy")
  // {
  //   return Colors.blueGrey;
  // }
  // else{
  //   return Colors.blue;
  // }
  // }
}
