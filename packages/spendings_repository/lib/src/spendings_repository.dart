import 'dart:async';

import 'package:spendings_api/spendings_api.dart';

class SpendingsRepository {
  const SpendingsRepository({
    required SpendingsApi spendingsApi,
  }) : _spendingsApi = spendingsApi;

  final SpendingsApi _spendingsApi;

  Stream<Spendings> getSpendings() => _spendingsApi.getSpendings();

  void changeTimeViewed(SpendingTimeViewed timeViewed) =>
      _spendingsApi.changeTimeViewed(timeViewed);

  Future<void> saveSpending(Spending spending) =>
      _spendingsApi.saveSpending(spending);
}
