
import 'package:flutter/material.dart';
import 'package:medi_link/core/helper/routes_name.dart';
import 'package:medi_link/features/home/presentation/views/home_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutesName.home:
      return MaterialPageRoute(builder: (_) => const HomeView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
