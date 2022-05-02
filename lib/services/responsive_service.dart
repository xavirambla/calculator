/*
 *
 *  Lugar donde colocamos los servicios de responsive para adaptar la aplicación a la pantalla
 *
 * 
 * Importante . Hay que inicializar el componente antes de empezar con:
 *       ResponsiveService.create( {},{}, {});
 * En caso de llamar a un textspan sin contexto, habrá que pasarlo o fallará:
 *      ResponsiveService.insertContext( context);
 *
 */

import 'package:calculator/share_preferences/preferences.dart';
import 'package:flutter/material.dart';

class ResponsiveService {

  static late ResponsiveService instance ;  // únicamente tendremos una instancia para toda la aplicación
  static bool initialized     = false;      //nos indica si la instancia ha sido inicializada

  static var sizeReferenceHeightMobile      = 680.0;  
  static var sizeReferenceWidthMobile       = 400.0;  //1.7

  late BuildContext context;
 // correctores Responsive para los textos ,width  and heights ( idioma-widget-key )
  Map<String, dynamic> textCorrector ={} ;
  Map<String, dynamic> widthCorrector = { };
  Map<String, dynamic> heightCorrector = { };
  Map<String, dynamic> sizeCorrector = { };

  ResponsiveService();


  static create(  Map<String, dynamic> textCorrectorJson , Map<String, dynamic> widthCorrectorJson ,Map<String, dynamic> heightCorrectorJson , Map<String, dynamic> sizeCorrectorJson  ){
    instance      = ResponsiveService();
    instance.textCorrector    =   textCorrectorJson;
    instance.widthCorrector   =   widthCorrectorJson;
    instance.heightCorrector  =   heightCorrectorJson;
    instance.sizeCorrector  =   sizeCorrectorJson;
    initialized               =   true;
    
  }

  static insertContext(BuildContext context){
       instance.context  =  context;
  }


  factory ResponsiveService.getInstance(){
    if ( !initialized )    throw new Exception("Instancia no creada del ResponsiveService");
      
    return instance;
  }
  



/*
import 'dart:io' show Platform;

    if (Platform.isAndroid) {
      // Android-specific code
    } else if (Platform.isIOS) {
      // iOS-specific code
    }
The options are:

Platform.isAndroid
Platform.isFuchsia
Platform.isIOS
Platform.isLinux
Platform.isMacOS
Platform.isWindows

*/ 


  
/*
  static var sizeReferenceHeightTablet7     = 900.0;
  static var sizeReferenceWidthTablet7      = 600.0; //1.5
  

  static var sizeReferenceHeightTablet10    = 1200.0;  
  static var sizeReferenceWidthTablet10     = 800.0;  //1.5
*/

/* 
  Convierte el size text para hacerlo responsive
*/
   double getResponsiveText( dynamic fontSize, { BuildContext? context    ,widget ="", key="" } ){
     if ( context!=null )  {this.context= context; }
      else  { context= this.context; }
    final language = Preferences.language;    
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;  
    //size * sizeReference / MediaQuery.of(context).size.longestSide;

    final proporcionWidth = widthScreen/sizeReferenceWidthMobile;
    final proporcionHeight = heightScreen/sizeReferenceHeightMobile;
        
    // cogemos la menor diferencia ya que en caso contrario, podríamos salirnos de la pantalla
    final proporcion  =  proporcionHeight>proporcionWidth ? proporcionWidth : proporcionHeight;
    double newFontSize = fontSize*  proporcion ;

  // corregimos el valor en caso que entre en el listado de correciones
    final keyCorrector = "$language-$widget-$key";
    if (textCorrector.containsKey( keyCorrector )){
        newFontSize = newFontSize + textCorrector[ keyCorrector]!;
    }

    return newFontSize ;

  }

/* Cuando no se puede usar un widget para reemplazar el widget original , atacamos directamente al style.
En este caso, esta función se suele usar cuando queremos reemplazar el style del textspan y hacerlo responsible.
 */
   TextStyle? generateTextStyleResponsible(  TextStyle? textStyle ,{ BuildContext? context ,widget ="", key="" } ){
        
     if (textStyle==null)                 return textStyle;
     if (textStyle.fontSize== null)       return textStyle;

     final language = Preferences.language;
     // corregimos el valor en caso que entre en el listado de correciones
     final keyCorrector = "$language-$widget-$key";        
     double fontSize = textStyle.fontSize!;
     if (textCorrector.containsKey( keyCorrector )){
        fontSize = fontSize + textCorrector[ keyCorrector]!;
     }   

     return  textStyle.copyWith( fontSize: getResponsiveText( fontSize  , context:context ));        
  }

/* Cuando no se puede usar un widget para reemplazar el widget original , atacamos directamente al style.
En este caso, esta función se suele usar cuando queremos reemplazar el style del IconTheme y hacerlo responsible.
 */
   IconThemeData? generateActionsIconThemeResponsible(  IconThemeData? iconThemeData ,{ BuildContext? context ,widget ="", key="" } ){
     if (iconThemeData==null)                 return iconThemeData;
     if (iconThemeData.size== null)           return iconThemeData;

     if ( context!=null )  {this.context= context; }
      else  { context= this.context; }
    final language = Preferences.language;    
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;  
    //size * sizeReference / MediaQuery.of(context).size.longestSide;

    final proporcionWidth = widthScreen/sizeReferenceWidthMobile;
    final proporcionHeight = heightScreen/sizeReferenceHeightMobile;
        
    // cogemos la menor diferencia ya que en caso contrario, podríamos salirnos de la pantalla
    final proporcion  =  proporcionHeight>proporcionWidth ? proporcionWidth : proporcionHeight;

     final keyCorrector = "$language-$widget-$key";        
     double size = iconThemeData.size! * proporcion;
     if (sizeCorrector.containsKey( keyCorrector )){
        size = size + sizeCorrector[ keyCorrector]!;
     }   
     return  iconThemeData.copyWith( size: size);    

  }




/* 
  Convierte el size  para hacerlo responsive
*/
   double getResponsiveWidthContainer(  dynamic size,{ BuildContext? context , widget ="", key="" } ){
    if ( context!=null )  {this.context= context; }
    else  { context= this.context; } 

    final language = Preferences.language;    
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;  
    //size * sizeReference / MediaQuery.of(context).size.longestSide;
    double newSize = size*  widthScreen /sizeReferenceWidthMobile ;
  // corregimos el valor en caso que entre en el listado de correciones
    final keyCorrector = "$language-$widget-$key";
    if (widthCorrector.containsKey( keyCorrector )){
        newSize = newSize+ widthCorrector[ keyCorrector]!;
    }    
//    print( "widthScreen : $widthScreen  heightScreen : $heightScreen   Size: $size    newSize : $newSize "  );
    return newSize ;
  }

  double getResponsiveHeightContainer(  dynamic size,{ BuildContext? context ,widget ="", key="" } ){
    if ( context!=null )  {this.context= context; }
    else  { context= this.context; }    

    final language = Preferences.language; 
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;  
    //size * sizeReference / MediaQuery.of(context).size.longestSide;

    double newSize = size*  heightScreen /sizeReferenceHeightMobile ;

  // corregimos el valor en caso que entre en el listado de correciones
    final keyCorrector = "$language-$widget-$key";
    if (heightCorrector.containsKey( keyCorrector )){
        newSize = newSize+ heightCorrector[ keyCorrector]!;
    }
    //print( "widthScreen : $widthScreen  heightScreen : $heightScreen   Size: $size    newSize : $newSize "  );

    return newSize ;
  }


}