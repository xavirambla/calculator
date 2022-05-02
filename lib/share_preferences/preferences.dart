/*
 *
 * Esta clase sirve para almacenar las opciones del usuario en la aplicación.
 *
 * @package XaviRambla_Calculator
 * @author  Xavi xavirambla@yahoo.es
 * @created 08/04/2022
 * @copyright Copyright (c) 2022 Xavi Rambla, https://xavirambla.net .
 */

import 'package:shared_preferences/shared_preferences.dart';

/*
En esta clase nos servirá para recuperar y guardar las preferencias de la aplicación

 */
class Preferences {

  static late SharedPreferences _prefs;  // el late le indica que se inciializará más tarde

  static String _name = '';
  static bool   _isDarkmode =false;
  static String _language='';
  static int    _gender= 1;

  //el constructor no puede ser asyncrono así que hacemos esto
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get name {
    return _prefs.getString( 'name' ) ?? _name;
  }

  static set name(String name){
    _name = name;
    _prefs.setString('name', _name);
  }

  static bool get isDarkmode {
    return _prefs.getBool( 'isDarkmode' ) ?? _isDarkmode;
  }

  static set isDarkmode(bool isDarkmode){
    _isDarkmode = isDarkmode;
    _prefs.setBool('isDarkmode', _isDarkmode);
  }

  static String get language {
    String res  = _prefs.getString( 'language' ) ?? _language ;
    if (res==""){
        return "en";
        }
    return res ;
  }


  static set language( String language ){
    _language = language;
    _prefs.setString('language', _language );
  }




  static int get gender {
    return _prefs.getInt( 'gender' ) ?? _gender;
  }

  static set gender(int gender){
    _gender = gender;
    _prefs.setInt('gender', _gender);
  }


}



