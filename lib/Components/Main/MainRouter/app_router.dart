import 'package:flutter/material.dart';
import 'package:pilot/Components/Main/HomeScreen/home_screen.dart';
import 'package:pilot/Components/Main/HomeScreen/home_screen_model.dart';
import 'package:pilot/Components/Main/HomeScreen/home_screen_view_model.dart';

abstract class AppRouter {
  Widget home();
}

class AppRouterImpl extends AppRouter {

  @override
  Widget home() {
    final model = HomeScreenModel();
    final viewModel = HomeScreenViewModel(model: model);
    final view = HomeScreen(viewModel: viewModel);
    return view;
  }
}