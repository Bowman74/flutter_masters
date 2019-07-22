library viewmodels;

import 'package:fmvvm/fmvvm.dart';
import 'package:auction_tracker/models/models.dart';
import 'package:auction_tracker/interfaces/serviceinterfaces.dart';
import 'package:auction_tracker/services/alerts.dart';

part 'landingpageviewmodel.dart';
part 'eventsviewmodel.dart';
part 'eventviewmodel.dart';

abstract class BaseViewModel extends ViewModel {
  NavigationService _navigationService;

  BaseViewModel(NavigationService navigationService) {
    _navigationService = navigationService;
  }

  void init(Object parameter) {
    
  }
}