import 'package:flutter/material.dart';
import 'package:hebi/pages/conf.dart';

import 'pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hebi.init();

  runApp(Home());
}
