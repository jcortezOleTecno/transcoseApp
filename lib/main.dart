import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vemare/app/view/_components/no_scale_widget/no_scale_widget.dart';
import 'package:vemare/app/view/app_router.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();
NavigatorState get navigator => navigatorKey.currentState!;

void main() {
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      navigatorKey: navigatorKey,
      initialRoute: AppRouter.initialPage,
      navigatorObservers: [_ClearFocusOnPush()],
      onGenerateRoute: AppRouter.generateRoute,
      builder: (_, child) {
        return NoScaleTextWidget(child: child!);
      },
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
