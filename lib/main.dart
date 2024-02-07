import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:vemare/app/data/about_us_repository.dart';
import 'package:vemare/app/data/auth_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/shared_preferences_static.dart';
import 'package:vemare/app/providers/footer_provider.dart';
import 'package:vemare/app/providers/url_state_provider.dart';
import 'package:vemare/app/view/_components/no_scale_widget/no_scale_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vemare/app/view/app_router.dart';
import 'package:vemare/app/view/our_history/bloc/our_history_cubit.dart';
import 'package:vemare/app/view/register/providers/register_provider.dart';
import 'package:vemare/app/view/shared/notifications/push_notifications.dart';
import 'package:vemare/app/view/shared/notifications_counter_bloc/notifications_cubit.dart';
import 'package:vemare/app/view/shared/shopping_car_counter_bloc/car_counter_cubit.dart';
import 'package:vemare/app/view/shared/userbloc/user_cubit.dart';
import 'package:vemare/app/view/splash/splash_initial_page.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/theme.dart';
import 'package:vemare/config/service_locator.dart';

import 'app/data/notifications_repository.dart';
import 'app/data/shopping_cart_repository.dart';

final navigatorKey = GlobalKey<NavigatorState>();
NavigatorState get navigator => navigatorKey.currentState!;
bool isReturns = false;
bool isClaims = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDataRepository().initPrefs();
  await SharedPreferencesLocal.configurePrefs();
  await ServiceLocator.setup();
  await Firebase.initializeApp();
  PushNotificationsProvider().initNotifications();
  setPathUrlStrategy();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false,create: ( _ ) => UrlDynamicProvider()),
        ChangeNotifierProvider(lazy: false,create: ( _ ) => FooterProvider()),
      ],
      child: const InitialApp(),
    );
  }
}

class InitialApp extends StatelessWidget {
  const InitialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    UrlDynamicProvider urlDynamicProvider = Provider.of<UrlDynamicProvider>(context);

    Widget childNow = const SplashInitialPage();
    if(urlDynamicProvider.appStatus == AppStatus.app){
      childNow = const MyApp();
    }
    return childNow;
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColor.primaryBlue,
        statusBarBrightness: Brightness.light,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(
            getIt.get<AuthRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => OurHistoryCubit(
            getIt.get<AboutUsRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => CarCounterCubit(
            getIt.get<ShoppingCardRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => NotificationsCounterCubit(
            getIt.get<NotificationsRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Transcose',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        initialRoute: AppRouter.initialPage,
        navigatorObservers: [_ClearFocusOnPush()],
        onGenerateRoute: AppRouter.generateRoute,
        builder: (_, child) {
          return NoScaleTextWidget(child: child!);
        },
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: PointerDeviceKind.values.toSet(),
        ),
        theme: ThemeData(
          cardColor: Colors.white,
          dialogTheme: const DialogTheme(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            surfaceTintColor: Colors.white
          ),
          cardTheme: const CardTheme(
            color: Colors.white
          )
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('es', 'ES'),
        ],
      ),
    );
  }
}

class _ClearFocusOnPush extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    final focus = FocusManager.instance.primaryFocus;
    focus?.unfocus();
  }
}
