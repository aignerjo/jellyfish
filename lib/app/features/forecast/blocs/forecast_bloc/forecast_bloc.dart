import 'package:bloc/bloc.dart';
import 'package:jellyfish/app/features/forecast/blocs/forecast_bloc/forecast_event.dart';
import 'package:jellyfish/app/features/forecast/blocs/forecast_bloc/forecast_state.dart';
import 'package:jellyfish/app/features/forecast/models/forecast_model.dart';
import 'package:jellyfish/app/features/forecast/repositories/forecast_repository.dart';


class ForecastBloc
    extends Bloc<ForecastEvent, ForecastState> {
  final ForecastRepository forecastRepository;

  ForecastBloc({required this.forecastRepository})
      : super(ForecastInitial());

  @override
  Stream<ForecastState> mapEventToState(
      ForecastEvent event) async* {
    yield ForecastFetchInProgress();

    try {
      List<ForecastModel> forecast = await forecastRepository.getForecast(from: DateTime.now());
      yield ForecastFetchSuccess(forecast);
    } catch (e) {
      yield ForecastFetchFailure();
    }
  }
}
