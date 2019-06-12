import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      // home: Scaffold(        
      //   body: HomePage()
      // ),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        print('Ruta llamada: ${settings.name}');
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()
        );
      },
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'ES')
      ],
    );
  }
}