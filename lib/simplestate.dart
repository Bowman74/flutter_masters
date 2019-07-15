

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

  SimpleStatePageState() {
    var person = _people.newPerson();
    person.firstName = 'Kevin';
    person.lastName = 'Ford';

    _people.addListener(() {
      setState(() {});
    });
  }

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
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(8.0),
                  itemCount: _people.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PersonRow(_people.getPerson(index));
                  }
                ),
              ),
              AddPerson(_people),
            ]
          ),
        )
      );
  }
}

class AddPerson extends StatelessWidget {
  AddPerson(this._people);
  
  final PeopleModel _people;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: 
        Text('Add Person'),
      onPressed: () {
        var person = _people.newPerson();
        person.firstName = 'aaa';
        person.lastName = 'bbb';
      },
    );
  }
}

class PersonRow extends StatefulWidget {
  final PersonModel _person;
  PersonRow(this._person);

  @override
  PersonRowState createState() {
    return PersonRowState(_person);
  }
}

class PersonRowState extends State<PersonRow> {
  final PersonModel _person;

  PersonRowState(this._person) {
    _person.addListener(listener);
  }

  listener() {
      setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_person.firstName + ' ' + _person.lastName),
    );
  }

  @override
  void dispose() {
    _person.removeListener(listener);
    super.dispose();
  }

}


class PeopleModel extends ChangeNotifier {
  List<PersonModel> _people = List<PersonModel>();

  PersonModel getPerson(int index) {
    return _people[index];
  }

  int get length => _people.length;

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