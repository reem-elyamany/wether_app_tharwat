import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:wether_app_tharwat/Cubits/getWeatherCubit/get_weather_states.dart';
import 'package:wether_app_tharwat/Services/whether_service.dart';
import 'package:wether_app_tharwat/screens/Search_page.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit():super(WeatherinitialState());

  getWeather({required String cityName}) async {
    try {
      wetherModel = await WetherService(Dio()).getForecast(cityName: cityName);
      emit(WeatherLoadedState(wetherModel!));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
