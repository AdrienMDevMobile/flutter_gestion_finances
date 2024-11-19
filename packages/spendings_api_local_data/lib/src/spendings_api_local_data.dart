import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spendings_api/spendings_api.dart';

class SpendingsApiLocalData extends SpendingsApi {
  SpendingsApiLocalData({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    _init();
  }

  final SharedPreferences _plugin;
  late final _spendingStreamController = BehaviorSubject<List<Spending>>.seeded(
    const [],
  );

  @visibleForTesting
  static const kSpendingsCollectionKey =
      '__micheldr_spendings_collection_key__';

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  void _init() {
    final spendingsJson = _getValue(kSpendingsCollectionKey);
    if (spendingsJson != null) {
      final todos = List<Map<dynamic, dynamic>>.from(
        json.decode(spendingsJson) as List,
      )
          .map((jsonMap) =>
              Spending.fromJson(Map<String, dynamic>.from(jsonMap)))
          .toList();
      _spendingStreamController.add(todos);
    } else {
      _spendingStreamController.add(const []);
    }
  }

  @override
  Stream<List<Spending>> getSpendings() =>
      _spendingStreamController.asBroadcastStream();

  @override
  Future<void> saveSpending(Spending spending) {
    final spendings = [..._spendingStreamController.value];
    spendings.add(spending);
    _spendingStreamController.add(spendings);
    return _setValue(kSpendingsCollectionKey, jsonEncode(spendings));
  }
}
