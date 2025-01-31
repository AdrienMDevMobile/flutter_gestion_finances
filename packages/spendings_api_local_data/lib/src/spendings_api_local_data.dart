import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spendings_api/spendings_api.dart';

class SpendingsApiLocalData extends SpendingsApi {
  late SpendingTimeViewed _currentTimeViewed = SpendingTimeViewed(
      month: DateTime.now().month, year: DateTime.now().year);

  late final SharedPreferencesWithCache _plugin;
  late final _spendingStreamController =
      BehaviorSubject<Spendings>.seeded(Spendings(
    timeViewed: _currentTimeViewed,
    spendings: const [],
  ));

  @visibleForTesting
  static const kSpendingsCollectionKey =
      '__micheldr_spendings_collection_date_key__';

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  Future<void> init() async {
    _plugin = await SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions(
            allowList: <String>{
          SpendingsApiLocalData.kSpendingsCollectionKey
        }));

    _getTimeViewed(DateTime.now().month, DateTime.now().year);
  }

  void _getTimeViewed(int month, int year) {
    _currentTimeViewed = SpendingTimeViewed(month: month, year: year);

    _spendingStreamController.add(_getSpendingsFromJson(_currentTimeViewed));
  }

  Spendings _getSpendingsFromJson(SpendingTimeViewed timeViewed) => Spendings(
      spendings: _getFilteredSpendingsFromJson(timeViewed),
      timeViewed: timeViewed);

  List<Spending> _getFilteredSpendingsFromJson(SpendingTimeViewed timeViewed) {
    final allSpendings = _getAllSpendingsFromJson(false);
    if (allSpendings.isNotEmpty) {
      return _filter(allSpendings, timeViewed);
    } else {
      return allSpendings;
    }
  }

  List<Spending> _filter(
      Iterable<Spending> spendings, SpendingTimeViewed timeViewed) {
    return spendings
        .where((s) =>
            s.date.year == timeViewed.year && s.date.month == timeViewed.month)
        .toList();
  }

  List<Spending> _getAllSpendingsFromJson(bool growable) {
    final spendingsJson = _getSpendingsJson();
    if (spendingsJson != null) {
      return List<Map<dynamic, dynamic>>.from(
        json.decode(spendingsJson) as List,
      )
          .map((jsonMap) =>
              Spending.fromJson(Map<String, dynamic>.from(jsonMap)))
          .toList(growable: growable);
    } else {
      return [];
    }
  }

  String? _getSpendingsJson() => _getValue(kSpendingsCollectionKey);

  @override
  Stream<Spendings> getSpendings() =>
      _spendingStreamController.asBroadcastStream();

  @override
  void changeTimeViewed(SpendingTimeViewed timeViewed) {
    _getTimeViewed(timeViewed.month, timeViewed.year);
  }

  @override
  Future<void> saveSpending(Spending spending) {
    final allSpendings = _getAllSpendingsFromJson(true);
    allSpendings.add(spending);

    _spendingStreamController.add(Spendings(
        spendings: _filter(allSpendings, _currentTimeViewed),
        timeViewed: _currentTimeViewed)); //changer cela
    return _setValue(kSpendingsCollectionKey, jsonEncode(allSpendings));
  }
}
