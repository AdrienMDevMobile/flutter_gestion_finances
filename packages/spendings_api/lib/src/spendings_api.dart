import 'package:spendings_api/src/model/spending.dart';

import '../spendings_api.dart';
import 'model/spendings_time_viewed.dart';

abstract class SpendingsApi {
  const SpendingsApi();

  Stream<Spendings> getSpendings();

  void changeTimeViewed(SpendingTimeViewed timeViewed);

  Future<void> saveSpending(Spending spending);
}
