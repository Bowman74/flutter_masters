part of viewmodels;

class EventsViewModel extends BaseViewModel {
  
  final IGalaEventService _galaEventService;
  
  EventsViewModel(
    NavigationService navigationService,
    this._galaEventService 
    ) : super(navigationService);

  @override
  void init(Object parameter) async {
    events = await _galaEventService.getEvents();
  }

  static PropertyInfo eventsProperty = PropertyInfo('events', NotificationList);

  NotificationList<Event> get events => getValue(eventsProperty);
  set events(NotificationList<Event> value) =>
      setValue(eventsProperty, value);

  void eventSelected(Event event) async {
    await _navigationService.navigate<EventViewModel>(parameter: event.id);
    events = await _galaEventService.getEvents();
  }

  void addEvent() async {
    await _navigationService.navigate<EventViewModel>();
    events = await _galaEventService.getEvents();
  }
}