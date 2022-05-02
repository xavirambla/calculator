/*
 *
 *  Pantalla de Ayuda De de la aplicación
 *
 * @package XaviRambla_Calculator
 * @author  Xavi xavirambla@yahoo.es
 * @created 08/04/2022
 * @copyright Copyright (c) 2022 Xavi Rambla, https://xavirambla.net .
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/l10n/gen/app_localizations.dart';
import 'package:calculator/themes/background.dart';
import 'package:calculator/widgets/widgets.dart';

import '../providers/providers.dart';
import '../services/services.dart';

class HelpScreen extends StatelessWidget {
   const HelpScreen ({Key? key}) : super(key:  key);

   @override
   Widget build (BuildContext context)  {
    ResponsiveService.insertContext(context);
    final currentTheme = Provider.of<ThemeProvider>(context).currentTheme;
      var   t = AppLocalizations.of(context);
      return  Scaffold(
        appBar: AppBar(
          title:   ResponsiveText( t!.helpTitle , style: currentTheme.appBarTheme.titleTextStyle ),
          iconTheme:   ResponsiveService.getInstance().generateActionsIconThemeResponsible( currentTheme.appBarTheme.iconTheme ),
          ),
         body:
           const Background(
             body:  _Body()    ,
             icon: Icons.help_center_outlined
           ),

      );
   }
}


class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var   t = AppLocalizations.of(context);

    return SingleChildScrollView(   // listview o singlechildScrolView
    child: Column(
      children:  [
        const SizedBox(height: 100,),
        CardContainer(
        //  paddinghorizontal: 15,

          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              _TitleAndDescription( title:"", description: t!.helpDescription1 ),
              _TitleAndDescription( title:"", description: t.helpDescription2 ),
              _TitleAndDescription( title:"", description: t.helpDescription3 ),
              _TitleAndDescription( title:"", description: t.helpDescription4),              

            ],
          )

        ),
          const SizedBox(height: 50,),
      ],
    )
           );
  }
}


class _TitleAndDescription extends StatelessWidget {
  const _TitleAndDescription({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context).currentTheme;

    return Column(
      children: [
          if( title.isNotEmpty ) RichText(
          textAlign: TextAlign.left,
          text:TextSpan(
                style: ResponsiveService.getInstance().generateTextStyleResponsible (currentTheme.textTheme.bodyText1, context:context),                
                children: <TextSpan>[
                   TextSpan(text: title, style:  ResponsiveService.getInstance().generateTextStyleResponsible ( TextStyle(fontWeight: FontWeight.bold , fontSize: 20), context:context ) ) ,
                ],
            )
        ),
        if( title.isNotEmpty ) const SizedBox(height: 8,),
        RichText(
          textAlign:  TextAlign.justify,
          text:TextSpan(
                style: ResponsiveService.getInstance().generateTextStyleResponsible (currentTheme.textTheme.bodyText1, context:context),                
                children: <TextSpan>[
                   TextSpan(text: description ),
                ],
            )
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
}




