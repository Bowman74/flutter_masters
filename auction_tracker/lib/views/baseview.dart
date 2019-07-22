library views;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fmvvm/fmvvm.dart';
import 'package:auction_tracker/viewmodels/baseviewmodel.dart';
import 'package:auction_tracker/utilities/wefcolors.dart';
import 'package:auction_tracker/models/models.dart';
import 'package:auction_tracker/valueconverters/valueconverters.dart';
import 'package:intl/intl.dart';

part 'landingpageview.dart';
part 'eventsview.dart';
part 'eventview.dart';

abstract class BaseView<T extends BaseViewModel> extends FmvvmStatefulWidget<T> {
  BaseView(ViewModel viewModel, {Key key}) : super(viewModel, key: key);

}