import 'package:equatable/equatable.dart';

class Energy extends Equatable {
  final int amount;
  final String unit;

  Energy({required this.amount, required this.unit});

  factory Energy.fromJson(Map<String, dynamic> json) {
    return Energy(
      amount: json['amount'],
      unit: json['unit'] as String
    );
  }

  @override
  List<Object> get props => [amount, unit];

}

class ForecastModel extends Equatable {
  final String country;
  final DateTime timestamp;
  final Energy solar;
  final Energy windOnshore;
  final Energy windOffshore;
  final Energy total;

  ForecastModel({required this.country, required this.timestamp, required this.solar, required this.windOnshore, required this.windOffshore, required this.total});

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      country: json['country'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      solar: Energy.fromJson(json['solar']),
      windOnshore: Energy.fromJson(json['windOnshore']),
      windOffshore: Energy.fromJson(json['windOffshore']),
      total: Energy.fromJson(json['energy']),
    );
  }

  @override
  List<Object?> get props => [
    country,
    timestamp,
    solar,
    windOnshore,
    windOffshore,
    total
  ];
}
