import 'package:bkd/services/flavors/flavors.dart';
import 'package:flutter/cupertino.dart';

import 'main.dart';


Future<void> main() async {
  F.appFlavor = Flavor.stg;
  runApp(MyApp());
}