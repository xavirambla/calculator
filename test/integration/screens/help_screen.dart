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
 * @created 08/04/2022
 * @copyright Copyright (c) 2022 Xavi Rambla, https://xavirambla.net .
 */


import '../configuration.dart';

void main() {


setUp(() async{
  confSetup();

});

  group ("Help Screen" , () {

    // Nos facilita el widget a testear
    Widget getWidget(){
        return const  HelpScreen();
    }

/* -----------------------------------------------------------------------------------------------
   ------------------------------- Basic Test ----------------------------------------------------
   ----------------------------------------------------------------------------------------------- */

//-----------------------------------------------
    testWidgets ('Basic' ,
    (WidgetTester tester) async {
      await tester.pumpWidget(
             makeTesteableWidget( child:   getWidget()  )
          ) ;


    //Basic Widgets
    expect(  find.byType( Scaffold ) , findsOneWidget);
    expect(  find.byType( AppBar ) , findsOneWidget);
    expect(  find.byType( Background ) , findsOneWidget);

    //Specific Widgets
    expect(  find.byType( SingleChildScrollView ) , findsOneWidget);
    expect(  find.byType( RichText ) , findsWidgets);
   } );




/* -----------------------------------------------------------------------------------------------
   ------------------------------- Translation Test ----------------------------------------------
   ----------------------------------------------------------------------------------------------- */
/*

Método para probar todos los textos del widget en el idioma seleccionado.
*/
  languageTest (){
        var  t = getAppLocalizations(Preferences.language);

    expect(find.text(t.helpTitle), findsOneWidget);
  }
//-----------------------------------------------
    testWidgets ('English Text' ,
    (WidgetTester tester) async {
      Preferences.language="en";
      await tester.pumpWidget(
             makeTesteableWidget( child: getWidget()  )
          ) ;
        languageTest ();

   } );

//-----------------------------------------------
    testWidgets ('Spanish Text' ,
    (WidgetTester tester) async {
      Preferences.language="es";
      await tester.pumpWidget(
             makeTesteableWidget( child: getWidget()  )
          ) ;
        languageTest ( );

   } );

    testWidgets ('Català Text' , 
    (WidgetTester tester) async {
      Preferences.language="ca";
      await tester.pumpWidget(    
             makeTesteableWidget( child: getWidget()  )         
          ) ;
        languageTest ( );

   } );   


    testWidgets ('Français Text' , 
    (WidgetTester tester) async {
      Preferences.language="fr";
      await tester.pumpWidget(    
             makeTesteableWidget( child: getWidget()  )         
          ) ;
        languageTest ( );

   } );      

/* -----------------------------------------------------------------------------------------------
   ------------------------------- Theme Test ----------------------------------------------
   ----------------------------------------------------------------------------------------------- */
   
        themeTest (WidgetTester tester ){

          final ThemeData tema =Preferences.isDarkmode ? AppTheme.darkTheme: AppTheme.lightTheme  ;

          var  t = getAppLocalizations(Preferences.language);             
          expect(  find.bySemanticsLabel( t.helpDescription1 ), findsWidgets);
          RichText description1 = tester.firstWidget(  find.bySemanticsLabel( t.helpDescription1 )  ) ;
          TextSpan text1 = description1.text as TextSpan;
          expect( text1.style!.color, tema.textTheme.bodyText1!.color );

          expect(  find.bySemanticsLabel( t.helpDescription2 ), findsWidgets);
          RichText description2 = tester.firstWidget(  find.bySemanticsLabel( t.helpDescription2 )  ) ;
          TextSpan text2 = description2.text as TextSpan;
          expect( text2.style!.color, tema.textTheme.bodyText1!.color );


        }    



    testWidgets ('LightMode Test' , 
    (WidgetTester tester) async {      
      Preferences.isDarkmode=false;
      await tester.pumpWidget(    
             makeTesteableWidget( child: getWidget()  )         
          ) ;               
        themeTest ( tester );    

   } );


    testWidgets ('DarkMode Test' , 
    (WidgetTester tester) async {      
      Preferences.isDarkmode=true;
      await tester.pumpWidget(    
             makeTesteableWidget( child: getWidget()  )         
          ) ;               
        themeTest ( tester );    

   } );


/* -----------------------------------------------------------------------------------------------
   ------------------------------- Functionality Test ----------------------------------------------
   ----------------------------------------------------------------------------------------------- */


   } );

}



