

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleStatePage extends StatefulWidget {
  SimpleStatePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  SimpleStatePageState createState() => SimpleStatePageState();
}

class SimpleStatePageState extends State<SimpleStatePage> {
  var _people = PeopleModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(itemBuilder: (BuildContext context, int index) {},

                ),
              ),
              FlatButton(
                child: 
                  Text('Refresh'),
                onPressed: () {
                  setState(() {});
                },
              ),
            ]
          ),
        )
      );
  }
}

class PeopleModel extends ChangeNotifier {
  List<PersonModel> _people = List<PersonModel>();

  Iterable get people => _people.toSet();

  PersonModel newPerson() {
    PersonModel _returnValue = PersonModel(_people.length + 1);
    _people.add(_returnValue);
    notifyListeners();
    return _returnValue;
  }

  void removePerson(PersonModel person)  {
    _people.remove(person);
  }
}

class PersonModel extends ChangeNotifier {
  PersonModel(this.id);

  final int id; 

  String _firstName = '';
  String get firstName => _firstName;
  set firstName(String value) {
    if (_firstName != value) {
      _firstName = value;
      this.notifyListeners();
    }
  }

  String _lastName = '';
  String get lastName => _lastName;
  set lastName(String value) {
    if (_lastName != value) {
      _lastName = value;
      this.notifyListeners();
    }
  }


}