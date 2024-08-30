import 'package:wether_app_tharwat/models/whether_model.dart';

class WeatherState {}

class WeatherinitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WetherModel wetherModel;

  WeatherLoadedState(this.wetherModel);
}

class WeatherFailureState extends WeatherState {
  WeatherFailureState(String string);
}
