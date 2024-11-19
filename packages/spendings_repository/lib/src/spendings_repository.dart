import 'dart:async';

import 'package:spendings_api/spendings_api.dart';

class SpendingsRepository {
  const SpendingsRepository({
    required SpendingsApi spendingsApi,
  }) : _spendingsApi = spendingsApi;

  final SpendingsApi _spendingsApi;

  Stream<List<Spending>> getSpendings() => _spendingsApi.getSpendings();

  Future<void> saveSpending(Spending spending) =>
      _spendingsApi.saveSpending(spending);
}
