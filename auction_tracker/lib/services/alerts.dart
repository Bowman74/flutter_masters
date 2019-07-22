
import 'package:auction_tracker/interfaces/alertinterfaces.dart';
import 'package:fmvvm/fmvvm.dart';
import 'package:flutter/material.dart';

class AlertService implements IAlertInterfaces {
  MessageService _messageService;
  Subscription _subscription;
  BuildContext _buildContext;

  AlertService(this._messageService) {
    _subscription = Subscription(Constants.newBuildContext, (c) {
      _buildContext = c;
    });

    _messageService.subscribe(_subscription);
  }
  
  @override
  Future showAlert(String title, String message, String buttonText) async {
    return showDialog<void>(
      context: _buildContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text(buttonText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Future<bool> showConfirmation(String title, String message, String positiveButtonText, String negativeButtonText) async {
    return showDialog<bool>(
      context: _buildContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text(negativeButtonText),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text(positiveButtonText),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _messageService.unsubscribe(_subscription);
  }
}