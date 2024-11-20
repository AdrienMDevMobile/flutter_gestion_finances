import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gestion_finances/app.dart';
import 'package:spendings_api/spendings_api.dart';
import 'package:spendings_repository/spendings_repository.dart';

import 'spending_observer.dart';

void bootstrap({required SpendingsApi spendingsApi}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    log(error.toString(), stackTrace: stack);
    return true;
  };

  Bloc.observer = const SpendingObserver();

  final spendingsRepository = SpendingsRepository(spendingsApi: spendingsApi);

  runApp(SpendingApp(spendingsRepository: spendingsRepository));
}
