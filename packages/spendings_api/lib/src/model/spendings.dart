import 'package:spendings_api/src/model/spendings_time_viewed.dart';

import '../../spendings_api.dart';

class Spendings {
  Spendings({required this.timeViewed, required this.spendings});

  final SpendingTimeViewed timeViewed;
  final List<Spending> spendings;
}
