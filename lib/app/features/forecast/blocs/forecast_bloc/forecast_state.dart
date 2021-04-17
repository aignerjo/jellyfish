import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jellyfish/app/features/forecast/models/forecast_model.dart';

@immutable
abstract class ForecastState extends Equatable {}

class ForecastInitial extends ForecastState {
  @override
  List<Object> get props => [];
}

class ForecastFetchInProgress extends ForecastState {
  @override
  List<Object> get props => [];
}

class ForecastFetchSuccess extends ForecastState {
  final List<ForecastModel> forecast;

  ForecastFetchSuccess(this.forecast);

  @override
  List<Object> get props => [forecast];
}

class ForecastFetchFailure extends ForecastState {
  @override
  List<Object> get props => [];
}
