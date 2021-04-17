import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ForecastEvent extends Equatable {}

class ForecastFetchStarted extends ForecastEvent {
  @override
  List<Object> get props => [];
}
