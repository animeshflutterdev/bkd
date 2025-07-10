import 'package:flutter/material.dart';

import '../../route/context_service.dart';

extension Spacing on num {
  double get fs =>
      MediaQuery.of(CurrentContext().context).textScaler.scale(toDouble());

  SizedBox get ph => SizedBox(height: toDouble());

  SizedBox get pw => SizedBox(width: toDouble());
}
