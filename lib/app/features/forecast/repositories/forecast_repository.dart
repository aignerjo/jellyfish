import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jellyfish/app/features/forecast/models/forecast_model.dart';

abstract class ForecastRepository {
  Future<List<ForecastModel>> getForecast({required DateTime from});
}

class IForecastRepository implements ForecastRepository {
  final String baseUrl;
  final String env;

  IForecastRepository({required this.baseUrl, this.env = 'dev'});

  @override
  Future<List<ForecastModel>> getForecast({required DateTime from}) async {
    final http.Response response = await http.get(
        Uri.https(baseUrl, '/$env/forecast', {'from': from.toUtc().toIso8601String()}));
    List<Map<String, dynamic>> forecastDTO = new List<Map<String, dynamic>>.from(json.decode(response.body));
    List<ForecastModel> forecast = List<ForecastModel>.from(forecastDTO.map((dto)=> ForecastModel.fromJson(dto)));
    return forecast;
  }
}
