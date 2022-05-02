/*
 *
 * Esta clase sirve para cambiar el tema de la aplicación.
 *
 * @package XaviRambla_Calculator
 * @author  Xavi xavirambla@yahoo.es
 * @created 08/04/2022
 * @copyright Copyright (c) 2022 Xavi Rambla, https://xavirambla.net .
 */

import 'package:flutter/material.dart';
import 'package:calculator/themes/app_theme.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData currentTheme;

//  ThemeProvider({ required bool isDarkmode}): currentTheme= isDarkmode ? ThemeData.dark() : ThemeData.light();
  ThemeProvider({ required bool isDarkmode}): currentTheme= isDarkmode ? AppTheme.darkTheme : AppTheme.lightTheme;

  setLightMode(){
    //currentTheme = ThemeData.light();
    currentTheme = AppTheme.lightTheme;
    notifyListeners();
  }
  setDarkmode(){
//    currentTheme = ThemeData.dark();
    currentTheme = AppTheme.darkTheme;

    notifyListeners();
  }

}



