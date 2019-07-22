part of viewmodels;

class LandingPageViewModel extends BaseViewModel {
  LandingPageViewModel(NavigationService navigationService, this._galaEventService) : super(navigationService);
  
  final IGalaEventService _galaEventService;

  Command _gotoEvents;

  Command get gotoEvents {
    _gotoEvents ??= Command(() {
      super._navigationService.navigate<EventsViewModel>();
    });
    return _gotoEvents;
  }
}