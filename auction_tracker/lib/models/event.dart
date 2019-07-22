part of models;

class Event extends BindableBase {
  String id;

  static PropertyInfo descriptionProperty = PropertyInfo('description', String, '');

  String get description => getValue(descriptionProperty);
  set description(String value) => setValue(descriptionProperty, value);

  static PropertyInfo eventDateProperty = PropertyInfo('eventDate', DateTime, DateTime.fromMillisecondsSinceEpoch(0));

  DateTime get eventDate => getValue(eventDateProperty);
  set eventDate(DateTime value) => setValue(eventDateProperty, value);

  static PropertyInfo currentEventProperty = PropertyInfo('currentEvent', bool, false);

  bool get currentEvent => getValue(currentEventProperty);
  set currentEvent(bool value) => setValue(currentEventProperty, value);

  static PropertyInfo ticketCostProperty = PropertyInfo('ticketCost', double, 0.0);

  double get ticketCost => getValue(ticketCostProperty);
  set ticketCost(double value) => setValue(ticketCostProperty, value);

  static PropertyInfo tableCostProperty = PropertyInfo('tableCost', double, 0.0);

  double get tableCost => getValue(tableCostProperty);
  set tableCost(double value) => setValue(tableCostProperty, value);

  Event() {
    var uuid = new Uuid();
    id = uuid.v4();
    eventDate = DateTime(2019, 11, 1);
  }
}
