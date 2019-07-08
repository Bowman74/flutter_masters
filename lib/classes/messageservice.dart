import 'dart:async';

class MessageService {
  static List<Subscription> _subscriptions = List<Subscription>();
  static List<_Messenger> _messengers = List<_Messenger>();

  void publish(Message message) {
    if (message == null) {
      throw ArgumentError('A message must be provided.');
    }

    if (_messengers.any((m) => m.name == message.name)) {
      var messenger = _messengers.singleWhere((m) => m.name == message.name);
      messenger.streamController.add(message.parameter);
    }
  }

  void subscribe(Subscription subscription) {
    if (subscription == null) {
      throw ArgumentError('A subscription must be provided.');
    }

    _subscriptions.add(subscription);
    if (!_messengers.any((m) => m.name == subscription.name)) {
      _messengers.add(_Messenger(subscription.name));
    }

    if (_messengers.any((m) => m.name == subscription.name)) {
      var messenger =
          _messengers.singleWhere((m) => m.name == subscription.name);

      messenger.streamController.stream
          .asBroadcastStream()
          .listen(subscription.messageHandler);
    }
  }

  void unsubscribe(Subscription subscription) {
    if (subscription == null) {
      throw ArgumentError('A subscription must be provided.');
    }

    _subscriptions.remove(subscription);

    if (!_subscriptions.any((s) => s.name == subscription.name)) {
      var messenger =
          _messengers.singleWhere((m) => m.name == subscription.name);

      _messengers.remove(messenger);
      messenger.close();
    }
  }

  void clearAllSubscriptions() {
    _messengers.forEach((m) {
      m.close();
    });

    _subscriptions = List<Subscription>();
    _messengers = List<_Messenger>();
  }
}

class _Messenger {
  _Messenger(String name) {
    this.name = name;
  }
  StreamController _streamController = StreamController.broadcast();

  String name;

  StreamController get streamController => _streamController;

  void close() {
    _streamController.close();
  }
}

class Subscription {
  Subscription(String name, Function(Object parameter) messageHandler) {
    _name = name;
    _messageHandler = messageHandler;
  }

  String _name;
  Function(Object parameter) _messageHandler;

  String get name => _name;

  Function(Object parameter) get messageHandler => _messageHandler;
}

class Message {
  Message(String name, Object parameter) {
    _name = name;
    _parameter = parameter;
  }

  String _name;
  Object _parameter;

  String get name => _name;
  Object get parameter => _parameter;
}
