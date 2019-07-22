library valueconverters;

import 'package:fmvvm/fmvvm.dart';
import 'package:intl/intl.dart';
import 'package:auction_tracker/viewmodels/baseviewmodel.dart';

class DateViewConverter implements ValueConverter {
  @override
  Object convert(Object source, Object value, {Object parameter}) {

    var date = value as DateTime;
    return DateFormat('yyyy-MM-dd').format(date.toLocal());
  }

  @override
  Object convertBack(Object source, Object value, {Object parameter}) {
    return value;
  }
}

class IsValidEventViewConverter implements ValueConverter {
  @override
  Object convert(Object source, Object value, {Object parameter}) {
    var isValid = value as bool;
    if (isValid) {
      var eventViewModel = parameter as EventViewModel;
      return () => eventViewModel.save.execute();
    } else {
      return null;
    }
  }

  @override
  Object convertBack(Object source, Object value, {Object parameter}) {
    return value;
  }
}