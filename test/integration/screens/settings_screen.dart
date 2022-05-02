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

  group ("Settings Screen" , () {

    // Nos facilita el widget a testear
    Widget getWidget(){
        return const  SettingsScreen();
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


   } );

/* -----------------------------------------------------------------------------------------------
   ------------------------------- Translation Test ----------------------------------------------
   ----------------------------------------------------------------------------------------------- */
/*

Método para probar todos los textos del widget en el idioma seleccionado.
*/
  languageTest (){
        var  t = getAppLocalizations(Preferences.language);

     expect(find.text(t.settingsTitle)                      , findsOneWidget);

     expect( find.bySemanticsLabel(t.darkmode)             , findsOneWidget);
     expect( find.bySemanticsLabel(t.language)                , findsOneWidget);



  }
//-----------------------------------------------
    testWidgets ('English Text' ,
    (WidgetTester tester) async {
      Preferences.language="en";
      await tester.pumpWidget(
             makeTesteableWidget( child: getWidget()  )
          ) ;
        languageTest ();
        expect( find.bySemanticsLabel("English")                    , findsOneWidget);
   } );

//-----------------------------------------------
    testWidgets ('Spanish Text' ,
    (WidgetTester tester) async {
      Preferences.language="es";
      await tester.pumpWidget(
             makeTesteableWidget( child: getWidget()  )
          ) ;
        languageTest ( );
        expect( find.bySemanticsLabel("Español")                    , findsOneWidget);
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
   ------------------------------- Functionality Test ----------------------------------------------
   ----------------------------------------------------------------------------------------------- */



//-----------------------------------------------
    testWidgets ('Functionality - Change Colors' ,
    (WidgetTester tester) async {
      Preferences.language="en";
      await tester.pumpWidget(
             makeTesteableWidget( child: getWidget()  )
          ) ;

      // DarK Mode
      var switchListTile =  find.byType( SwitchListTile );
      expect( switchListTile, findsOneWidget );
      var oldMode = Preferences.isDarkmode;
      Text oldtext = tester.firstWidget( find.text('Dark Mode') );
      Color oldColor = oldtext.style?.color ?? Colors.red;   // cogemos el color actual del texto

      await tester.tap( switchListTile );   // cambiamos el modo Dark
      await tester.pump();
      expect ( Preferences.isDarkmode , !oldMode);   // Comprobamos que ya no mantenemos el mismo valor en Preferences


      Text text = tester.firstWidget( find.text('Dark Mode') );
      expect( text.style!.color != oldColor , true );   // comprobamos que se ha cambiado el color del texto
       if (Preferences.isDarkmode){
           expect( text.style!.color  , AppTheme.darkTheme.textTheme.bodyText1!.color );
       }
        else{
          expect( text.style!.color  ,AppTheme.lightTheme.textTheme.bodyText1!.color );
        }



   } );

//-----------------------------------------------
    testWidgets ('Functionality - Change Language' ,
    (WidgetTester tester) async {
      Preferences.language="en";
      await tester.pumpWidget(
             makeTesteableWidget( child: getWidget()  )
          ) ;


      var language = find.byType( DropdownButton<String> );
      expect(language, findsOneWidget );
      await tester.tap( language );
      await tester.pumpAndSettle();

      var dropdownItem = find.text('Español').last;

      await tester.tap (dropdownItem);
      await tester.pumpAndSettle();

      expect( Preferences.language,"es");



   } );

//-----------------------------------------------
    testWidgets ('Functionality - Change Language' ,
    (WidgetTester tester) async {
      Preferences.language="es";
      await tester.pumpWidget(
             makeTesteableWidget( child: getWidget()  )
          ) ;


      var language = find.byType( DropdownButton<String> );
      expect(language, findsOneWidget );
      await tester.tap( language );
      await tester.pumpAndSettle();

      var dropdownItem = find.text('English').last;

      await tester.tap (dropdownItem);
      await tester.pumpAndSettle();

      expect( Preferences.language,"en");

   } );

   } );

}



