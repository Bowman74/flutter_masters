import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelPage extends StatefulWidget {
  ScopedModelPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ScopedModelPageState createState() => ScopedModelPageState();
}

class ScopedModelPageState extends State<ScopedModelPage> {

  PeopleModel createPeople() {
    var people = PeopleModel();
    var person = people.newPerson();
    person.firstName = 'Kevin';
    person.lastName = 'Ford';
    return people;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ScopedModel<PeopleModel>(
        model: createPeople(),
        child: Builder(
          builder: (context) => Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(8.0),
                    itemCount: ScopedModel.of<PeopleModel>(context, rebuildOnChange: true).length,
                    itemBuilder: (BuildContext context, int index) {
                      return ScopedModel<PersonModel>(
                        model: ScopedModel.of<PeopleModel>(context, rebuildOnChange: true).getPerson(index),
                        child: PersonRow()
                      );
                    }
                  ),
                ),
                AddPerson(),
              ]
            ),
          ),
        ),
      )
    );
  }
}

class AddPerson extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<PeopleModel>(
      builder: (context, child, people) => FlatButton(
          child: 
            Text('Add Person'),
              onPressed: () {
                var person = people.newPerson();
                person.firstName = 'aaa';
                person.lastName = 'bbb';
          },
        ),
    );
  }
}

class PersonRow extends StatefulWidget {

  @override
  PersonRowState createState() {
    return PersonRowState();
  }
}

class PersonRowState extends State<PersonRow> {
  
  @override
  Widget build(BuildContext context) {
    var person = ScopedModel.of<PersonModel>(context, rebuildOnChange: true);
    return ListTile(
      title: Text(person.firstName + ' ' + person.lastName),
    );
  }

}

class PeopleModel extends Model {
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

class PersonModel extends Model {
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