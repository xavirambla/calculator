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


import 'helpers/helpers.dart'       as helpers;
import 'models/models.dart'         as models;
import 'providers/providers.dart'   as providers;
import 'router/app_routes.dart'     as app_routes;
import 'services/services.dart'     as services;
import 'themes/themes.dart'         as themes;
import 'widgets/widgets.dart'         as widgets;
import 'share_preferences/preferences.dart'       as preferences;



void main(){
    helpers.main();
    models.main();
    providers.main();
    app_routes.main();
    services.main();
    themes.main();
    widgets.main();
    preferences.main();

}

