/*
 *
 *  Pantalla principal de la aplicación
 *
 * @package XaviRambla_Calculator
 * @author  Xavi xavirambla@yahoo.es
 * @created 08/04/2022
 * @copyright Copyright (c) 2022 Xavi Rambla, https://xavirambla.net .
 */

import 'package:calculator/services/responsive_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/l10n/gen/app_localizations.dart';
import 'package:calculator/providers/providers.dart';
import 'package:calculator/router/app_routes.dart';
import 'package:calculator/themes/themes.dart';
import 'package:calculator/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen ({Key? key}) : super(key:  key);

   @override
   Widget build (BuildContext context){     
     ResponsiveService. insertContext( context );
      var   t = AppLocalizations.of(context);
      final currentTheme = Provider.of<ThemeProvider>(context).currentTheme;

      return Scaffold(

      appBar: AppBar(
        elevation: 0,
        title:  ResponsiveText( t!.homeTitle, style: currentTheme.appBarTheme.titleTextStyle ) ,
        iconTheme:   ResponsiveService.getInstance().generateActionsIconThemeResponsible( currentTheme.appBarTheme.iconTheme ),
        actions: const [

             _PopupSettings(),
        ],
        ),


         body:
            Background(
             body:   Center(
                 child: Column(children: [
                    CardLine(),
                    CardTable()
                   ],
              ),
//             icon: Icons.qr_code_2,

           ),




      )
      
      );
   }
}

class _PopupSettings extends StatelessWidget {
  const _PopupSettings({
    Key? key,
  }) : super(key: key);

/*
 * Función que le pasamos las opciones y nos duevelve los popupMenuItems para poder ser usados
*/
  List<PopupMenuItem> _getMenuOptions( context,menuOptions){
    List<PopupMenuItem> resultado =[];
    final currentTheme = Provider.of<ThemeProvider>(context).currentTheme;
    for (var option in menuOptions){
      resultado.add(
        PopupMenuItem(
            child: ResponsiveText( option.title ,style : currentTheme.popupMenuTheme.textStyle  ),
            value: option.route ,
          )
      );

    }
    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    var   t = AppLocalizations.of(context);
    final menuOptions =  _getMenuOptions( context, AppRoutes.getMenuSettings( t ) );

    

    return PopupMenuButton(
      itemBuilder: (context) {
        return menuOptions;
        },
      onSelected: ( choice) {
//          print(choice);   //cuidado en caso de no existir el screen de la route entonces aparecerá pantalla negra
          Navigator.pushNamed(context, choice.toString() );
      } ,
 //             child: CircleAvatar(

      child: const ClipOval(
        child:  Icon(Icons.settings) ,
   //           )
    ),  );
  }
}


