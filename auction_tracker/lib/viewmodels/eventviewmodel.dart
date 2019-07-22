part of viewmodels;

class EventViewModel extends BaseViewModel {
  
  final IGalaEventService _galaEventService;
  final AlertService _alertService;
  Event _event;
  bool _newEvent = true;
  
  EventViewModel( 
    NavigationService navigationService,
    this._galaEventService,
    this._alertService) : super(navigationService);

  @override
  void init(Object parameter) async {
    super.init(parameter);
    if (parameter != null) {
      var id = parameter as String;
      _event = await _galaEventService.getEventById(id);

      _newEvent = false;
    } else {
      _event = Event();
      _newEvent = true;
    }
  }

  Command _save;

  Command get save {
    _save ??= Command(() async {
      if (_newEvent) {
        _event = await _galaEventService.addEvent(_event);
      } else {
        var savedEvent = await _galaEventService.saveEvent(_event);
        print(savedEvent);
      }
      _navigationService.navigateBack();
    });
    return _save;
  }

  Command _delete;

  Command get delete {
    _delete ??= Command(() async {
      if (await _alertService.showConfirmation("Delete Event", "Do you want to delete this event?", "Delete", "Cancel")) {
        _galaEventService.deleteEvent(_event.id);
        await _alertService.showAlert("Deleted", "Event deleted", "OK");
        _navigationService.navigateBack();
      }
    });
    return _delete;
  }

  Event get event {
    return _event;
  }

  @override
  dispose() {
    super.dispose();
    _alertService.dispose();
  }
}