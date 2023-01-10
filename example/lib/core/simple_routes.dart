import 'package:flutter/material.dart';

import '../main.dart';

class SimpleRoutes {
  static Map<String, Widget Function(BuildContext)> of(BuildContext context) {
    return <String, Widget Function(BuildContext)>{
      HomePage.route: (BuildContext context) => const HomePage(),
      PageA.route: (BuildContext context) => const PageA(),
      PageB.route: (BuildContext context) => const PageB(),
      PageC.route: (BuildContext context) => const PageC(),
      PageD.route: (BuildContext context) => const PageD(),
    };
  }
}
