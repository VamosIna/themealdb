import 'package:flutter/material.dart';
import 'package:mealmisg/route/router.dart';

import 'config/config.dart';

Future<void> main() async {
  await Config.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final UniqueKey _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: _key,
      debugShowCheckedModeBanner: false,
      title: 'Meal Food',
      routerConfig: goRouter,
      builder: (context, child) {
        final MediaQueryData data = MediaQuery.of(context);
        double textScaleFactor = 1;
        if (data.size.height < 600) {
          textScaleFactor = 0.75;
        }
        final screenHost = Overlay(
          initialEntries: [
            if (child != null) ...[
              OverlayEntry(
                builder: (context) => _ScreenHost(child: child),
              ),
            ],
          ],
        );
        return MediaQuery(
          data: data.copyWith(textScaleFactor: textScaleFactor),
          child: screenHost,
        );
      },
    );
  }
}

class _ScreenHost extends StatelessWidget {
  const _ScreenHost({
    this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child ?? const SizedBox.shrink(),
    );
  }
}
