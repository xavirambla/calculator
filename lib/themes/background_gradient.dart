/*
 *
 *  Esta clase pinta un degradado de color de fondo de pantalla
 *
 * @package XaviRambla_Calculator
 * @author  Xavi xavirambla@yahoo.es
 * @created 08/04/2022
 * @copyright Copyright (c) 2022 Xavi Rambla, https://xavirambla.net .
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calculator/providers/providers.dart';

class BackgroundGradient extends StatelessWidget {
  final IconData? icon;
  final Widget? body;

  const BackgroundGradient({
    Key? key, this.icon, this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context).currentTheme;

    final backgroundColor1 = currentTheme.primaryColorLight;
    final backgroundColor2 = currentTheme.primaryColorDark;


    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children:  [
          _Gradient(backgroundColor1: backgroundColor1, backgroundColor2: backgroundColor2),
          if(icon!=null) _HeaderIcon( icon: icon!  ),  // Insertamos un icono para darle un fondo con un dibujo
          if (body!=null) body!
        ],)
    );
  }
}

class _Gradient extends StatelessWidget {
  const _Gradient({
    Key? key,
    required this.backgroundColor1,
    required this.backgroundColor2,
  }) : super(key: key);

  final Color backgroundColor1;
  final Color backgroundColor2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        gradient: LinearGradient(colors: [
          backgroundColor1,
          backgroundColor2,
         ],
         begin: Alignment.bottomCenter,
         end: Alignment.topCenter,
         )
        ),

    );
  }
}


/*
  Clase para pintar un icono , normalmente de fondo de pantalla
*/
class _HeaderIcon extends StatelessWidget {
  final IconData icon;

  const _HeaderIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context).currentTheme;

    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top:10),
                child:  Icon( icon  , color: currentTheme.primaryColorDark ,size:240),
      ),
    );
  }
}



