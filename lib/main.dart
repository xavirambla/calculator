
import 'package:calculator/services/services.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/gen/app_localizations.dart';

import 'package:calculator/router/app_routes.dart';
import 'package:calculator/share_preferences/preferences.dart';
import 'package:calculator/providers/providers.dart';


/*
ejecutar para el tema de los idiomas
flutter pub add flutter_gen
*/

void main() async {
//  await Preferences.init(); // esto fallará
// PAra arreglarlo lanzamos este wiget y ahora funcionará
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init(); 
  ResponsiveService.create( {},{}, {} , {});// Activamos los servicios de REsponsive para adaptación de la app a la pantalla
  


// Permite cambiar la orientación de la aplicación
/*
  SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown    
    ]);
*/
    runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider( create: ( _ ) => ThemeProvider(isDarkmode: Preferences.isDarkmode)),
            ChangeNotifierProvider( create: ( _ ) => LanguageProvider( language: Preferences.language )),

            ChangeNotifierProvider( create: ( _ ) => CalculatorProvider( )),

          ],
          child: const MyApp(),
        )

    );
}





class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final languageProvider  = Provider.of<LanguageProvider>( context);
    final currentTheme = Provider.of<ThemeProvider>(context).currentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:        'Calculator App',
//multiidioma
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      supportedLocales:     AppLocalizations.supportedLocales ,
      initialRoute:         AppRoutes.initialRoute ,
      routes:               AppRoutes.getAppRoutes(),
      locale:               languageProvider.selectedLocale,
   //   onGenerateRoute:      AppRoutes.onGenerateRoute,   // quitamos el parámetro y entonces coge el parámetro recibido por defecto
      theme: currentTheme,


    );
  }
}



