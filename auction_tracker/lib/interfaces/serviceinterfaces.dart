import 'package:auction_tracker/models/models.dart';
import 'package:fmvvm/fmvvm.dart';

abstract class IGalaEventService { 
  Future<Event> getCurrentEvent();
  Future<NotificationList<Event>> getEvents();
  Future<Event> getEventById(String eventId);
  Future<Event> saveEvent(Event event);
  Future<Event> addEvent(Event event);
  Future deleteEvent(String eventId);
}