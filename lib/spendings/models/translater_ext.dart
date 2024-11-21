import 'package:flutter_gestion_finances/spendings/models/spending.dart';
import 'package:spendings_api/spendings_api.dart' as sdata;

Spending toView(sdata.Spending spending) => Spending(
      value: spending.value,
      name: spending.name,
      date: spending.date,
    );

sdata.Spending toData(Spending spending) => sdata.Spending(
      value: spending.value,
      name: spending.name,
      date: spending.date,
    );
