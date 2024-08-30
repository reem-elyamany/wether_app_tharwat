import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:wether_app_tharwat/models/whether_model.dart';

class WetherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '64893b633d204391937145638231210';
  WetherService(this.dio);
  Future<WetherModel?> getForecast({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      // if (response.statusCode == 200) {
      WetherModel wetherModel = WetherModel.fromJson(response.data);

      //} else {
      //final String errorMessage = response.data['error']['message'];
      //throw Exception(errorMessage);
      // }
      return wetherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'oops there was an error, try later';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('error');
    }
  }
}
