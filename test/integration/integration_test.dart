/*
 *
 * This is a basic Flutter to Test all Objects of Unit Environment.
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


import 'screens/screens.dart'                     as screens;
import 'widgets/widgets.dart'                     as widgets;
import 'share_preferences/preferences.dart'       as preferences;



void main(){
    screens.main();
    widgets.main();
    preferences.main();
}

