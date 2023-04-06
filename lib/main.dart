import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:vemare/app/data/about_us_repository.dart';
import 'package:vemare/app/data/auth_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/_components/no_scale_widget/no_scale_widget.dart';
import 'package:vemare/app/view/about_us/bloc/about_us_cubit.dart';
import 'package:vemare/app/view/app_router.dart';
import 'package:vemare/app/view/our_history/bloc/our_history_cubit.dart';
import 'package:vemare/app/view/shared/bloc/user_cubit.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/theme.dart';
import 'package:vemare/config/service_locator.dart';

final navigatorKey = GlobalKey<NavigatorState>();
NavigatorState get navigator => navigatorKey.currentState!;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  await LocalDataRepository().initPrefs();
  await ServiceLocator.setup();
  runApp(const MyApp());
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
        )
      ],
      child: MaterialApp(
        title: 'Vemare',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
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
