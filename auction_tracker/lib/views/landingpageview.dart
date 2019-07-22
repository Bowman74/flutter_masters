part of views;

class LandingPageView extends FmvvmStatefulWidget<LandingPageViewModel> {
  LandingPageView(LandingPageViewModel viewModel, {Key key}) : super(viewModel, key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title = 'Gala Auction Tracker';

  @override
  LandingPageState createState() => LandingPageState(bindableBase);
}

class LandingPageState extends FmvvmState<LandingPageView, LandingPageViewModel> {
  LandingPageState(LandingPageViewModel viewModel) : super(viewModel, true);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: Text('Auction Tracker')),
            drawer: new Drawer(
        child: Column(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(color: WefColors.blue,
              child: new DrawerHeader(
                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Gala Auction Tracker', style: TextStyle(color: Colors.white, fontSize: 16)),
                      Image(image: AssetImage('assets/wef-logo-white.png')),
                    ],
                ),
              ),
            ),
            ListTile(title: Text('Events'), onTap: () {
              Navigator.pop(context);
              bindableBase.gotoEvents.execute();
              }),
            ListTile(title: Text('Donors'), onTap: () {
              Navigator.pop(context);
            },),
            ListTile(title: Text('Auction Items'), onTap: () {
              Navigator.pop(context);
            },),
            ListTile(title: Text('Record Payments'), onTap: () {
              Navigator.pop(context);
            },),
            ListTile(title: Text('Reports'), onTap: () {
              Navigator.pop(context);
            },),
            Spacer(),
            AboutListTile(child: Text('WEF 2019')),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('TBD'),
          ],
        ),
      )
    );
  }
}