import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'json_map.dart';

part 'spending.g.dart';

@immutable
@JsonSerializable()
class Spending extends Equatable {
  final int value;
  final String name;
  final DateTime date;

  Spending({required this.value, required this.name, required this.date});

  @override
  List<Object?> get props => [value, name, date];

  static Spending fromJson(JsonMap json) => _$SpendingFromJson(json);

  JsonMap toJson() => _$SpendingToJson(this);
}
