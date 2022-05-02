/*
 *
 *  Pantalla de Configuración de la aplicación
 *
 * @package XaviRambla_Calculator
 * @author  Xavi xavirambla@yahoo.es
 * @created 08/04/2022
 * @copyright Copyright (c) 2022 Xavi Rambla, https://xavirambla.net .
 */

import 'package:flutter/material.dart';
import 'package:calculator/share_preferences/preferences.dart';
import 'package:provider/provider.dart';
import 'package:calculator/themes/themes.dart';
import 'package:calculator/l10n/gen/app_localizations.dart';
import 'package:calculator/providers/providers.dart';

import '../services/services.dart';
import '../widgets/widgets.dart';


class SettingsScreen extends StatefulWidget {
  static const String routerName ='Settings';

   const SettingsScreen ({Key? key}) : super(key:  key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

   @override
   Widget build (BuildContext context){
     ResponsiveService.insertContext(context);
     final currentTheme = Provider.of<ThemeProvider>(context).currentTheme;
     TextStyle styleTitle = ResponsiveService.getInstance().generateTextStyleResponsible ( currentTheme.textTheme.headline2! , context:context)!;

//     double vheight = MediaQuery.of(context).size.height;
     var   t = AppLocalizations.of(context);

      final Map<String,String> optionsLanguage = LanguageProvider.getLanguages( Preferences.language );

      return Scaffold(
        appBar: AppBar(
          title:   ResponsiveText( t!.settingsTitle , style: currentTheme.appBarTheme.titleTextStyle ),
          iconTheme:   ResponsiveService.getInstance().generateActionsIconThemeResponsible( currentTheme.appBarTheme.iconTheme ),

          ),
//          drawer: const SideMenu(),
         body: Stack(
           children:[
             //background
             const Background(),
             //front
              SingleChildScrollView(   // recomendable cuando tienes cajas de texto, para evitar que el teclado puede tapar el widget

              child: Container(
                padding: const EdgeInsets.all(15),   // lo quitamos del containter interior para ponero a fuera y así  quedea más fino.

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,

                  children:[
//                    Text( t.settingsTitle ,style: styleTitle  ),
  //                  const Divider(),
                    SwitchListTile(
                      value: Preferences.isDarkmode,
                      title: ResponsiveText( t.darkmode, style:  currentTheme.textTheme.bodyText1 ),
                      
                    onChanged:  ( value ){
                          Preferences.isDarkmode=value;
                          final themeProvider = Provider.of<ThemeProvider>(context,listen:false);
                          value
                            ? themeProvider.setDarkmode()
                            : themeProvider.setLightMode();
                          setState(() {      });


                    }
                    ),
                    const SizedBox(height:  30 ,),
                    Column(
                      children: [
                        ResponsiveText( t.languageTitle, style:  currentTheme.textTheme.bodyText1 ),
                        DropdownButton<String>(
                          hint:  ResponsiveText( t.languageTitle ),
                          isExpanded: true,
                            items: optionsLanguage
                                      .map((String key, String value) {
                                          return MapEntry (
                                            key,
                                            DropdownMenuItem<String> (
                                              value: value,
                                              child: ResponsiveText(key, style:  currentTheme.textTheme.bodyText1)
                                            )
                                          );
                        }).values.toList(),
                        onChanged: ( newValue){
                              Preferences.language = newValue!;
                              final languageProvider  = Provider.of<LanguageProvider>( context, listen:false);
                              languageProvider.selectedLocale  = languageProvider.getLocale( Preferences.language );
                              setState(() {      });

                        },
                        value: Preferences.language.isEmpty? "en": Preferences.language,


      ),
                      ],
                    ),






                  ]
                  ,),
              ),
           ),
           ]
         )

      );
   }
}



