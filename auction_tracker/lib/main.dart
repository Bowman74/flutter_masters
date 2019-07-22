import 'package:flutter/material.dart';
import 'views/baseview.dart';
import 'viewmodels/baseviewmodel.dart';
import 'utilities/wefcolors.dart';
import 'interfaces/serviceinterfaces.dart';
import 'interfaces/alertinterfaces.dart';
import 'fakes/galaeventservice.dart';
import 'package:fmvvm/fmvvm.dart';
import 'services/alerts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends FmvvmApp {
  @override 
  void registerComponents(ComponentResolver componentResolver) {
    super.registerComponents(componentResolver);

    componentResolver.registerType<IGalaEventService>(() {return FakeGalaEventService();});

    componentResolver.registerType<LandingPageViewModel>(() {return LandingPageViewModel(componentResolver.resolveType<NavigationService>(), componentResolver.resolveType<IGalaEventService>());});
    componentResolver.registerType<EventsViewModel>(() {return EventsViewModel(componentResolver.resolveType<NavigationService>(), componentResolver.resolveType<IGalaEventService>());});
    componentResolver.registerType<EventViewModel>(() {return EventViewModel(componentResolver.resolveType<NavigationService>(), componentResolver.resolveType<IGalaEventService>(), componentResolver.resolveType<IAlertInterfaces>());});

    componentResolver.registerType<IAlertInterfaces>(() {return AlertService(componentResolver.resolveType<MessageService>());});
  }
  @override
  String getInitialRoute() {
    return 'LandingPageView';
  }

  @override
  Route getRoutes(RouteSettings settings) {
    if (settings.name == 'LandingPageView') {
      var arguments = settings.arguments ??
          Core.componentResolver
              .resolveType<NavigationService>()
              .createViewModel<LandingPageViewModel>(null);
      return buildRoute(settings, new LandingPageView(arguments));
    } else if (settings.name == 'EventsView') {
      return buildRoute(settings, new EventsView(settings.arguments));
    }
    else if (settings.name == 'EventView') {
      return buildRoute(settings, new EventView(settings.arguments));
    }
    return null;
  }

  @override
  String getTitle() {
    return 'Auction Tracker';
  }

  @override
  ThemeData getTheme() {
    return ThemeData(
        primarySwatch: WefColors.bluePalette,
        accentColor: WefColors.redPalette
    );
  }
}