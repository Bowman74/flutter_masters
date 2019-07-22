import 'package:auction_tracker/interfaces/serviceinterfaces.dart';
import 'package:auction_tracker/models/models.dart';
import 'package:fmvvm/fmvvm.dart';

class FakeGalaEventService implements IGalaEventService {
  static List<Event> _events;

  FakeGalaEventService() {
    if (_events == null) {
      _events = List<Event>();

      var event1 = Event();
      event1.description = 'Gala 2019';
      event1.currentEvent = true;
      event1.eventDate = DateTime(2019, 11, 4);
      _events.add(event1);

      var event2 = Event();
      event2.description = 'Gala 2018';
      event2.currentEvent = false;
      event2.eventDate = DateTime(2018, 11, 4);
      _events.add(event2);
    }
  }

  @override
  Future<Event> getCurrentEvent() {
    return Future.sync(() { return _copyEvent(_events.singleWhere((s) => s.currentEvent));});
  }

  @override
  Future<NotificationList<Event>> getEvents() {
    return Future.sync(() { return NotificationList.from(_events, growable: true);});
  }

  @override
  Future<Event> getEventById(String eventId) async {
    return Future.sync(() { return _copyEvent(_events.singleWhere((s) => s.id == eventId));});
  }

  @override
  Future<Event> saveEvent(Event event) {
    return Future.sync(() async {
      _events.removeWhere((e) => e.id == event.id);
      _events.add(event);
      await _setCurrentEvent(event);
      return event;
    });
  }

  Event _copyEvent(Event event) {
    var returnValue = Event();
    returnValue.id = event.id;
    returnValue.description = event.description;
    returnValue.eventDate = event.eventDate;
    returnValue.currentEvent = event.currentEvent;
    return returnValue;
  }

  @override
  Future<Event> addEvent(Event event) {
    return Future.sync(() async {
      _events.add(event);
      await _setCurrentEvent(event);
      return event;
    });
  }

  @override
  Future deleteEvent(String eventId) {
    return Future.sync(() async {
      _events.removeWhere((e) => e.id == eventId );
    });
  }

  Future _setCurrentEvent(Event event) {
    return Future.sync(() async {
      if (event.currentEvent) {
        _events.forEach((e) {
          if (e.id != event.id) {
            e.currentEvent = false;
          }
        });
      }
    });
  }
}