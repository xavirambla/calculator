/*
 *
 *  Esta clase pinta la carcasa de un formulario de la aplicación
 *
 *
 * @package XaviRambla_Calculator
 * @author  Xavi xavirambla@yahoo.es
 * @created 08/04/2022
 * @copyright Copyright (c) 2022 Xavi Rambla, https://xavirambla.net .
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/providers/providers.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  const CardContainer({
    Key? key,
    required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 60),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(40),
        decoration: _createCardShape( context),
        child: child,


      ),
    );
  }

  BoxDecoration _createCardShape( context ) {
    final currentTheme = Provider.of<ThemeProvider>(context).currentTheme;

    return BoxDecoration(

    color: currentTheme.dialogBackgroundColor,
    borderRadius: BorderRadius.circular(25),
    //sombreado
    boxShadow:  [
      BoxShadow(
        color: currentTheme.shadowColor,
        blurRadius: 15,
        offset: const Offset( 0,5)
        )


    ]
  );
  }
}


