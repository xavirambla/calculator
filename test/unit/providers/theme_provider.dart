/*
 *
 * This is a basic Flutter widget test.
 *
 * To perform an interaction with a widget in your test, use the WidgetTester
 * utility that Flutter provides. For example, you can send tap and scroll
 * gestures. You can also use WidgetTester to find child widgets in the widget
 * tree, read text, and verify that the values of widget properties are correct.
 *
 * @package XaviRambla_Calculator
 * @author  Xavi xavirambla@yahoo.es
 * @created 12/04/2022
 * @copyright Copyright (c) 2022 Xavi Rambla, https://xavirambla.net .
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/providers/providers.dart';
import 'package:calculator/themes/app_theme.dart';


void main() {

  group ("Theme Provider" , () {

    test ('Create in DarkMode' , ()  {
      ThemeProvider themeProvider = ThemeProvider(isDarkmode: true);
      expect(themeProvider.currentTheme , AppTheme.darkTheme );
    });

    test ('Create in LightMode' , ()  {
      ThemeProvider themeProvider = ThemeProvider(isDarkmode: false);
      expect(themeProvider.currentTheme , AppTheme.lightTheme );
    });

    test ('set LightMode' , ()  {
      //Arrange
      ThemeProvider themeProvider = ThemeProvider(isDarkmode: true);
      //Act
      themeProvider.setLightMode();
      //assert
      expect(themeProvider.currentTheme , AppTheme.lightTheme );
    });

    test ('set DarkMode' , ()  {
      //Arrange
      ThemeProvider themeProvider = ThemeProvider(isDarkmode: false);
      //Act
      themeProvider.setDarkmode();
      //assert
      expect(themeProvider.currentTheme , AppTheme.darkTheme );
    });




  });

    }

