import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../UI/pages/home_page.dart';

class FunctionalityCubit extends Cubit <Widget> {
  FunctionalityCubit(super.initialState);
  List<Widget> pages = [
    Homepage(),

  ];
}