part of views;

class EventsView extends FmvvmStatelessWidget<EventsViewModel> {
  EventsView(EventsViewModel viewModel, {Key key}) : super(viewModel, true,  key: key);

  final String title = 'events';

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: BindingWidget<EventsViewModel>(
        bindings: <Binding>[
          Binding('eventlist', bindableBase, EventsViewModel.eventsProperty)
        ],
        builder: (bc) => ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        itemCount: (BindingWidget.of<EventsViewModel>(bc).getValue('eventlist')
                      as NotificationList)
                  .length,
        itemBuilder: (context, position) {
          return ListTile(title: Hero(
                    tag: 'description' + bindableBase.events[position].id,
                    child: Text(bindableBase.events[position].description),
                    ), 
            selected: (BindingWidget.of<EventsViewModel>(bc)
                    .getValue('eventlist') as NotificationList)[position].currentEvent,
            subtitle: Hero(
                    tag: 'date' + bindableBase.events[position].id,
                    child: Text(new DateFormat.yMd().format((BindingWidget.of<EventsViewModel>(bc)
                    .getValue('eventlist') as NotificationList)[position].eventDate))),
            onTap: () => bindableBase.eventSelected((BindingWidget.of<EventsViewModel>(bc)
                    .getValue('eventlist') as NotificationList)[position]),
                      );
                    },
                  ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => bindableBase.addEvent(),
          child: Icon(Icons.add),
        ),
      );
    }
}
