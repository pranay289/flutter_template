import 'package:flutter/material.dart';
import 'package:localisation/strings.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:services/services.dart';

import 'package:themes/themes.dart';

import 'navigation/app_router.dart';
import 'navigation/route_paths.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      themes: [
        ThemeData(
            textTheme: const TextTheme(
                bodyLarge: TextStyle(fontFamily: 'Poppins'),
                bodyMedium: TextStyle(fontFamily: 'Poppins'),
                bodySmall: TextStyle(fontFamily: 'Poppins'),
                displayLarge: TextStyle(fontFamily: 'Poppins'),
                displayMedium: TextStyle(fontFamily: 'Poppins'),
                displaySmall: TextStyle(fontFamily: 'Poppins'),
                titleLarge: TextStyle(fontFamily: 'Poppins'),
                titleMedium: TextStyle(fontFamily: 'Poppins'),
                titleSmall: TextStyle(fontFamily: 'Poppins'),
                labelLarge: TextStyle(fontFamily: 'Poppins'),
                labelMedium: TextStyle(fontFamily: 'Poppins'),
                labelSmall: TextStyle(fontFamily: 'Poppins'),
            ),
            backgroundColor: Colors.red,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: Colors.blue,
              brightness: Brightness.light,
            )),
      ],
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          background: Colors.blue[700],
          secondary: Colors.yellow[700],
          brightness: Brightness.dark,
        ),
      ),
      lightTheme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          background: Colors.blue[300],
          secondary: Colors.yellow[300],
          brightness: Brightness.light,
        ),
      ),
      builder: (context, regularTheme, darkTheme, themeMode) {
        return MaterialApp(
          key: AppService.appKey,
          navigatorKey: AppService.navigatorKey,
          builder: (context, widget) => ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!),
            maxWidth: 1400,
            minWidth: 360,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(360, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
          ),
          localizationsDelegates: const [
            Strings.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: Strings.delegate.supportedLocales,
          onGenerateTitle: (context) => Strings.of(context).appName,
          debugShowCheckedModeBanner: false,
          theme: regularTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          onGenerateRoute: AppRouter.generateRoute,
          /*home: WeatherDetailPage(
            param: WeatherDetailPageParam(
              Location(
                locationId: '633191078d244f330e4f238d',
                name: 'Pune',
                geometryLocation: GeometryLocation(
                  type: 'Point',
                  coordinates: [
                    73.856743,
                    18.520430,
                  ],
                ),
              ),
            ),
          ),*/
          initialRoute: RoutePaths.splash,
        );
      },
    );
  }
}
