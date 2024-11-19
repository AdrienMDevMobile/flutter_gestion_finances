import 'package:spendings_api/src/model/spending.dart';

abstract class SpendingsApi {
  const SpendingsApi();

  Stream<List<Spending>> getSpendings();

  Future<void> saveSpending(Spending spending);
}
