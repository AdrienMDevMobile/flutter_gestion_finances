import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gestion_finances/app.dart';
import 'package:flutter_gestion_finances/counter_observer.dart';

void main() {
  Bloc.observer = const SpendingObserver();
  runApp(const SpendingApp());
}
