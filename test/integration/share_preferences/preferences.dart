/*
 *
 * Test de integración.
 *
 * @package XaviRambla_Calculator
 * @author  Xavi xavirambla@yahoo.es
 * @created 08/04/2022
 * @copyright Copyright (c) 2022 Xavi Rambla, https://xavirambla.net .
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/share_preferences/preferences.dart';


void main(){

setUp(() async{
  await Preferences.init();

});

  group ("Preferences Valores Iniciales " , () {
    test ('Nombre' ,  () async {
      expect(Preferences.name,"");
      } );

    test ('DarkMode' ,  () async {
      expect(Preferences.isDarkmode, false);
      } );

    test ('language' ,  () async {
      expect(Preferences.language, "en" );
      } );

    test ('gender' ,  () async {
      expect(Preferences.gender, 1 );
      } );


   });

  group ("Preferences Modificar Valores " , () {
    test ('Nombre' ,  () async {
      Preferences.name = "Hola";
      expect(Preferences.name,"Hola");
      Preferences.name =""; // se deja el valor inicial para que no falle los test de Valores iniciales
      } );

    test ('DarkMode' ,  () async {
      Preferences.isDarkmode =true;
      expect(Preferences.isDarkmode, true);
      Preferences.isDarkmode =false;
      expect(Preferences.isDarkmode, false);
      } );

    test ('language' ,  () async {
      Preferences.language="en"   ;
      expect(Preferences.language, "en" );
      Preferences.language="es"   ;
      expect(Preferences.language, "es" );
      Preferences.language=""   ;  // se deja el valor inicial para que no falle los test de Valores iniciales
      } );

    test ('gender' ,  () async {
      Preferences.gender=5;
      expect(Preferences.gender, 5 );
      Preferences.gender=6;
      expect(Preferences.gender, 6 );
      Preferences.gender=1;    // se deja el valor inicial para que no falle los test de Valores iniciales
      } );


   });


}


