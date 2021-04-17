import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jellyfish/app/features/forecast/blocs/forecast_bloc/bloc.dart';

class ForecastPage extends StatefulWidget {
  @override
  _ForecastPageState createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  late ForecastBloc forecastBloc;

  @override
  void initState() {
    super.initState();
    forecastBloc = context.read<ForecastBloc>();
    forecastBloc.add(ForecastFetchStarted());
  }

  @override
  void dispose() {
    super.dispose();
    forecastBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ForecastBloc, ForecastState>(
      bloc: forecastBloc,
      builder: (BuildContext context, ForecastState state) {
        if (state is ForecastFetchSuccess) {
          final current = (state.forecast[0].solar.amount +
              state.forecast[0].windOffshore.amount +
              state.forecast[0].windOffshore.amount) /
                  state.forecast[0].total.amount;
          return Container(
              height: double.infinity,
              width: double.infinity,
              child: Center(child: Text("${(current * 100).round()}%", style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))));
        }
        if (state is ForecastFetchFailure) {
          return Container(
              height: double.infinity,
              width: double.infinity,
              child: Center(child: Text("Error")));
        }

        return Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(child: CircularProgressIndicator()));
      },
    ));
  }
}
