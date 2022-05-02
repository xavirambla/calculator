/*
 *
 *  Lugar donde colocamos todas las rutas de la aplicación para acceder a todas las opciones.
 *
 * @package XaviRambla_Calculator
 * @author  Xavi xavirambla@yahoo.es
 * @created 08/04/2022
 * @copyright Copyright (c) 2022 Xavi Rambla, https://xavirambla.net .
 */


import 'package:flutter/material.dart';
import 'package:calculator/models/models.dart';
import 'package:calculator/screens/screens.dart';

class AppRoutes {

  static const initialRoute='home';

// almacena todas las opciones y las pantallas donde apuntan
  static final menuOptions = <MenuOption>[

       MenuOption(route: 'settings',  name:'Settings Screen',     title: 'Settings',    screen: const SettingsScreen() ,          icon: Icons.settings  ,           ),
       MenuOption(route: 'help',      name:'Ayuda',               title: 'Help',        screen: const HelpScreen() ,              icon: Icons.help ,    ),
       MenuOption(route: 'about',     name:'Acerca de',           title: 'About',       screen: const AboutScreen() ,             icon: Icons.read_more ,  ),


    //todo:borrar home
    //MenuOption(route: 'home',name:'Home Screen', screen: const HomeScreen() , icon: Icons.home ),
    /*
    MenuOption(route: 'listview1',name:'listview1 Screen', screen: const ListView1Screen() , icon: Icons.list_alt_rounded ),
    MenuOption(route: 'listview2',name:'listview2 Screen', screen: const ListView1Screen() , icon: Icons.list_sharp ),
    MenuOption(route: 'alert',name:'Alert Screen', screen: const AlertScreen() , icon: Icons.add_alert_outlined ),
    MenuOption(route: 'card',name:'Card Screen', screen: const CardScreen() , icon: Icons.add_alert_outlined ),
    MenuOption(route: 'avatar',name:'Circle Avatar Screen', screen: const AvatarScreen() , icon: Icons.supervised_user_circle_outlined ),
    MenuOption(route: 'animated',name:'Animated Screen', screen: const AnimatedScreen() , icon: Icons.play_arrow_outlined),
    MenuOption(route: 'ideas',name:'Ideas Screen', screen: const IdeasScreen() , icon: Icons.play_arrow_outlined),
    MenuOption(route: 'inputs',name:'Text Inputs', screen: const InputsScreen() , icon: Icons.input_rounded),
    MenuOption(route: 'slider',name:'Slider & checks', screen: const SliderScreen() , icon: Icons.slow_motion_video_outlined),
    MenuOption(route: 'listviewbuilder',name:'InfiniteScroll & Pull to refresh', screen: const ListViewBuilderScreen() , icon: Icons.slow_motion_video_outlined),
*/
  ];

  static  Map<String, Widget Function(BuildContext)> getAppRoutes(){
    Map<String, Widget Function(BuildContext)> appRoutes ={   };

     // lo saco del menu per lo mantengo en la página principal
    appRoutes.addAll( { 'home' :  (BuildContext context) => const  HomeScreen() } );

    for (final option in menuOptions ) {
      appRoutes.addAll( {  option.route   : ( BuildContext context) => option.screen   } ) ;
    }

    return appRoutes;
  }


 /*
  * Devuelve la lista de opciones que se mostraràn cuando pulse el botón Settings
  */
  static  List<MenuOption> getMenuSettings( t ){
    final filtro =  ['settings','help', 'about'];

    final settingsOptions = menuOptions.where((element) => filtro.contains(element.route)  ).toList();

    // las traducciones no pueden hacerse en static pq necesitamos el context, así que las hacemos un replace con el texto traducido
    settingsOptions.where((element) => element.route =="settings").first.title = t!.settingsTitle;
    settingsOptions.where((element) => element.route =="help").first.title = t.helpTitle;
    settingsOptions.where((element) => element.route =="about").first.title = t.aboutTitle;


    return settingsOptions;
  }

/*
 * Devuelve la pantalla de la opción en base al nombre de la pantalla
 */
  static Widget getScreen( screenName ){
    for (final option in menuOptions ) {
        if (screenName == option.route){
           return option.screen;
        }

    }
    throw RouteException();

  }




}


class RouteException implements Exception {
  String errorMessage() {
    return ("Route not exists");
  }
}


