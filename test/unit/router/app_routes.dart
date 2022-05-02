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

import '../../integration/configuration.dart';


void main() {


  group ("App_Routes" , () {

    test ('GetAppRoutes' , ()  {
      final routes = AppRoutes.getAppRoutes();

      expect ( routes.length, 4);
    });



    test ('getMenuSettings' , ()  {

      final t =  getAppLocalizations( "EN" );
      final routes = AppRoutes.getMenuSettings( t );
      final list = [ 'Settings Screen' , 'Ayuda' , 'Acerca de' ];
      expect ( routes.length, 3);

      for (var item in routes) {
        expect(list.contains(item.name), true);
      }

    });


    test ('getScreen' , ()  {


      var screen = AppRoutes.getScreen( 'settings' );
      expect ( screen, isNotNull );

      screen = AppRoutes.getScreen( 'help' );
      expect ( screen, isNotNull );

      screen = AppRoutes.getScreen( 'about' );
      expect ( screen, isNotNull );

    });

  });

}

