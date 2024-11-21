// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spending.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Spending _$SpendingFromJson(Map<String, dynamic> json) => Spending(
      value: (json['value'] as num).toInt(),
      name: json['name'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$SpendingToJson(Spending instance) => <String, dynamic>{
      'value': instance.value,
      'name': instance.name,
      'date': instance.date.toIso8601String(),
    };
