/*
 *
 * This is a basic Flutter widget to configure all your tests in Integration Environment.
 *
 * To perform an interaction with a widget in your test, use the WidgetTester
 * utility that Flutter provides. For example, you can send tap and scroll
 * gestures. You can also use WidgetTester to find child widgets in the widget
 * tree, read text, and verify that the values of widget properties are correct.
 *
 * @package XaviRambla_Calculator
 * @author  Xavi xavirambla@yahoo.es
 * @created 08/04/2022
 * @copyright Copyright (c) 2022 Xavi Rambla, https://xavirambla.net .
 */

import 'package:calculator/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:calculator/l10n/gen/app_localizations.dart';
import 'package:calculator/providers/providers.dart';
import 'package:calculator/router/app_routes.dart';
import 'package:calculator/share_preferences/preferences.dart';
import 'package:calculator/themes/themes.dart';
import 'package:calculator/screens/screens.dart';
import 'package:calculator/widgets/widgets.dart';
import 'package:calculator/themes/background_gradient.dart';
import 'package:calculator/models/models.dart';
import 'package:calculator/l10n/gen/app_localizations_ca.dart';
import 'package:calculator/l10n/gen/app_localizations_en.dart';
import 'package:calculator/l10n/gen/app_localizations_es.dart';
import 'package:calculator/l10n/gen/app_localizations_fr.dart';



// Exportamos todo para no tener que hacer importaciones en los tests y simplificar el código.

export 'package:flutter/material.dart';
export 'package:flutter_localizations/flutter_localizations.dart';
export 'package:provider/provider.dart';
export 'package:flutter_test/flutter_test.dart';
export 'package:mockito/mockito.dart';

export 'package:calculator/l10n/gen/app_localizations.dart';
export 'package:calculator/providers/providers.dart';
export 'package:calculator/router/app_routes.dart';
export 'package:calculator/share_preferences/preferences.dart';
export 'package:calculator/themes/themes.dart';
export 'package:calculator/screens/screens.dart';
export 'package:calculator/widgets/widgets.dart';
export 'package:calculator/themes/background_gradient.dart';
export 'package:calculator/models/models.dart';

/*
Indica los idiomas que se van a testear en la app
 */
List<Locale> getSupportedLocales(){
      return const [
             Locale('es'),
             Locale('en'),
             Locale('ca'),
             Locale('fr'),
          ];
    }

/*
Facilita un MaterialApp para poder probar el Widget facilitado
 */
MaterialApp getMaterialApp( { required Widget child } ){

    var materialApp = MaterialApp(
          localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,

             ],
          locale:               Locale( Preferences.language ),
          supportedLocales:     getSupportedLocales(),
//          initialRoute:         AppRoutes.initialRoute ,
          routes:               AppRoutes.getAppRoutes(),
          theme:                Preferences.isDarkmode ? AppTheme.darkTheme : AppTheme.lightTheme,
          home:                 child


         );
    return materialApp;
}

/*
Crear la Configuración y todo lo  necesario para probar el Widget con los providers activados
 */
 Widget makeTesteableWidget({required Widget child}) {
    var materialApp = getMaterialApp( child:child );
    ResponsiveService.create( {},{}, {}, {} );

    //  Pasamos los providers sino peta por todos lados
    return MultiProvider(
          providers: [
            ChangeNotifierProvider( create: ( _ ) => ThemeProvider(isDarkmode: Preferences.isDarkmode)),
            ChangeNotifierProvider( create: ( _ ) => LanguageProvider( language: Preferences.language )),

            ChangeNotifierProvider( create: ( _ ) => CalculatorProvider( )),
          ],
          child: materialApp

        );
     }

/*
Configuración básica de SetUP para nuestros tests.
*/
confSetup() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  PackageInfo.setMockInitialValues(appName: "abc", packageName: "com.getwedge.wedge", version: "1.0", buildNumber: "2", buildSignature: "buildSignature");


}

// Devuelve las Localizaciones en base al lenguaje seleccionado
AppLocalizations getAppLocalizations( String language ){

  switch (language ){
    case "en": return AppLocalizationsEn();
    case "es": return AppLocalizationsEs();
    case "ca": return AppLocalizationsCa();
    case "fr": return AppLocalizationsFr();
    default: return AppLocalizationsEn();
  }


    }

/* Nos indica si el changeNotifier avisa a los objetos
Ex: isCalled = checkNotifierCalled(  calculator, () => calculator.reset() );
 */
dynamic checkNotifierCalled(  ChangeNotifier notifier,   Function() action, [   Matcher? matcher,]) {
  var isFired = false;
  void setter() {
    isFired = true;
    notifier.removeListener(setter);
  }

  notifier.addListener(setter);

  final result = action();
  // if asynchronous
  if (result is Future) {
    return result.then((value) {
      if (matcher != null) {
        expect(value, matcher);
      }
      return isFired;
    });
  } else {
    if (matcher != null) {
      expect(result, matcher);
    }
    return isFired;
  }
}