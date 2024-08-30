import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app_tharwat/Cubits/getWeatherCubit/get_weather_cubit.dart';
import 'package:wether_app_tharwat/Services/whether_service.dart';
import 'package:wether_app_tharwat/models/whether_model.dart';
import 'package:flutter/foundation.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search City"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onSubmitted: (value) async {
            var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
            getWeatherCubit.getWeather(cityName: value);
            wetherModel =
                await WetherService(Dio()).getForecast(cityName: value);
            Navigator.pop(context);
           // log(wetherModel!.cityName);
            // log(wetherModel?.cityName);
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            labelText: 'Search',
            hintText: 'Enter city name',
            suffixIcon: Icon(Icons.search),
            suffixIconColor: Colors.black,
            border: OutlineInputBorder(
                //  borderRadius: BorderRadius.circular(16),
                // borderSide: BorderSide(color: Colors.green),
                ),
            // enabledBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.amber),
            // ),
            // focusedBorder: OutlineInputBorder()
          ),
        ),
      )),
    );
  }
}

WetherModel? wetherModel;
