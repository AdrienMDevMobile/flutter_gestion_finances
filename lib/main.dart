import 'package:flutter/widgets.dart';
import 'package:flutter_gestion_finances/bootstrap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spendings_api_local_data/spendings_api_local_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final spendingsApi =
      SpendingsApiLocalData(plugin: await SharedPreferences.getInstance());
  bootstrap(spendingsApi: spendingsApi);
}
