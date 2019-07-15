import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatefulWidget {
  ProviderPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ProviderPageState createState() => ProviderPageState();
}

class ProviderPageState extends State<ProviderPage> {

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
        body: ChangeNotifierProvider<PeopleModel>(
          builder: (BuildContext context) => createPeople(),
          child: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Consumer<PeopleModel>(
                    builder: (context, people, _) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(8.0),
                        itemCount: people.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ChangeNotifierProvider<PersonModel>(
                            builder: (BuildContext context) => people.getPerson(index),
                            child: PersonRow()
                          );
                        }
                      );
                    }
                  ),
                ),
                AddPerson(),
              ]
            ),
          )
        )
      );
  }
}

class AddPerson extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<PeopleModel>(
      builder: (context, people, _) {
        return FlatButton(
          child: 
            Text('Add Person'),
          onPressed: () {
            var person = people.newPerson();
            person.firstName = 'aaa';
            person.lastName = 'bbb';
          },
        );
      }
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
    return Consumer<PersonModel>(
      builder: (context, person, _) {
        return ListTile(
          title: Text(person.firstName + ' ' + person.lastName),
        );
      },
    );
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