import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jellyfish/app/features/forecast/blocs/forecast_bloc/forecast_bloc.dart';
import 'package:jellyfish/app/features/forecast/pages/forecast_page.dart';
import 'package:jellyfish/app/features/forecast/repositories/forecast_repository.dart';

class Forecast extends StatelessWidget {
  static const String kForecastBaseUrl = "FORECAST_BASE_URL";
  static const String kForecastEnv = "FORECAST_ENV";

  @override
  Widget build(BuildContext context) {
    const String forecastBaseUrl = String.fromEnvironment(kForecastBaseUrl);
    const String forecastEnv = String.fromEnvironment(kForecastEnv);

    print(forecastBaseUrl);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ForecastRepository>(
            create: (context) => IForecastRepository(
                baseUrl: forecastBaseUrl, env: forecastEnv)),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider(
            create: (BuildContext context) => ForecastBloc(
                forecastRepository: context.read<ForecastRepository>())),
      ], child: ForecastPage()),
    );
  }
}
