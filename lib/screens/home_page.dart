import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app_tharwat/Cubits/getWeatherCubit/get_weather_cubit.dart';
import 'package:wether_app_tharwat/Cubits/getWeatherCubit/get_weather_states.dart';
import 'package:wether_app_tharwat/Widgets/NoWhetherApp.dart';
import 'package:wether_app_tharwat/Widgets/WhetherBody.dart';
import 'package:wether_app_tharwat/screens/Search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchPage();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherinitialState) {
              return NoWhethweApp();
            } else if (state is WeatherLoadedState) {
              return WhetherBody(
                wetherModel: state.wetherModel,
              );
            } else {
              return Text('opps there was an error');
            }
          },
        ));
  }
}







//(Cubit stebs)



//Create States
//Create Cubit
//Create Function
//Provide Cubit
//Integrate Cubit
//Trigger Cubit
