part of views;

class EventView extends FmvvmStatelessWidget<EventViewModel> {
  EventView(EventViewModel viewModel) : super(viewModel, true);

  final descriptionController = TextEditingController();

  final String title = 'event';

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: Text(title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              tooltip: 'delete',
              onPressed: () => bindableBase.delete.execute(),
            ),]),
      body: BindingWidget<EventViewModel>(
        bindings: <Binding>[
          Binding('description', bindableBase.event, Event.descriptionProperty),
          Binding('stringeventdate', bindableBase.event, Event.eventDateProperty, valueConverter: DateViewConverter()),
          Binding('eventdate', bindableBase.event, Event.eventDateProperty),
          Binding('currentevent', bindableBase.event, Event.currentEventProperty),
        ],
        builder: (bc) {
          descriptionController.text = BindingWidget.of<EventViewModel>(bc)
                      .getValue('description');
          return Container(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Description'),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container( child: TextField(
                      controller: descriptionController,
                      onChanged: BindingWidget.of<EventViewModel>(bc)
                        .getOnChanged('description'),
                    ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Event Date'),
                ),
                Row(
                  children: <Widget>[Expanded(
                    flex: 1,
                    child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: FlatButton(
                      onPressed: () async {
                        var newDate = await showDatePicker(
                          context: context,
                          initialDate: BindingWidget.of<EventViewModel>(bc).getValue('eventdate'),
                          firstDate: DateTime(2018),
                          lastDate: DateTime(2030),
                          builder: (BuildContext context, Widget child) {
                            return Theme(
                              data: ThemeData.light(),
                              child: child,
                            );
                          }
                        );
                        if (newDate != null) {
                          BindingWidget.of<EventViewModel>(bc).getOnChanged('eventdate')(newDate);
                        }
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Hero(
                          tag: 'description' + bindableBase.event.id,
                          child: Text(BindingWidget.of<EventViewModel>(bc)
                          .getValue('stringeventdate'))),
                      ),
                    ),
                    ),
                  ),
                ]),
                Row(
                    children: [
                      Text('Current Event'),
                      Checkbox(
                        value: BindingWidget.of<EventViewModel>(bc)
                          .getValue('currentevent'),
                        onChanged: BindingWidget.of<EventViewModel>(bc)
                          .getOnChanged('currentevent'),
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
        ),
        floatingActionButton: FloatingActionButton(
              onPressed: () => bindableBase.save.execute(),
              child: Icon(Icons.save),
        )
      );
    }
}