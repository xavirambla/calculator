// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:calculator/main.dart';
import 'package:calculator/services/services.dart';

import './integration/configuration.dart';

void main() {
  
setUp(() async{
  confSetup();
  
});  


  
    // Nos facilita el widget a testear
    MaterialApp getMaterialApp( ){

    var materialApp = MaterialApp(
          localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,

             ],
          locale:               Locale( Preferences.language ),
          supportedLocales:     getSupportedLocales(),
          initialRoute:         AppRoutes.initialRoute ,
          routes:               AppRoutes.getAppRoutes(),
          theme:                Preferences.isDarkmode ? AppTheme.darkTheme : AppTheme.lightTheme


         );
    return materialApp;
}

 Widget makeTesteableWidget({required Widget child}) {
    var materialApp = getMaterialApp(  );
    ResponsiveService.create( {},{}, {}, {});
    //  Pasamos los providers sino peta por todos lados
    return MultiProvider(
          providers: [
            ChangeNotifierProvider( create: ( _ ) => ThemeProvider(isDarkmode: Preferences.isDarkmode)),
            ChangeNotifierProvider( create: ( _ ) => LanguageProvider( language: Preferences.language )),
            ChangeNotifierProvider( create: ( _ ) => CalculatorProvider( )),
          ],
          child: materialApp
        );
     }


    Widget getWidget(){
        return const  MyApp();
    }

/* -----------------------------------------------------------------------------------------------
   ------------------------------- Basic Test ----------------------------------------------------
   ----------------------------------------------------------------------------------------------- */

//-----------------------------------------------
  group ("Main Screen" , () {
    testWidgets ('Basic' , 
    (WidgetTester tester) async {
      await tester.pumpWidget(    
             makeTesteableWidget( child:   getWidget()  )         
          ) ;      
    //Basic Widgets

    expect(  find.byType( Scaffold ) , findsOneWidget);
    expect(  find.byType( AppBar ) , findsOneWidget);
    expect(  find.byType( Background ) , findsOneWidget);
    expect(  find.byType( HomeScreen ) , findsOneWidget);

    //Specific Widgets
    expect(  find.byType( CardLine ) , findsOneWidget);
    expect(  find.byType( CardTable ) , findsOneWidget);    
   } );
  
  });


  group ("Visit Screens" , () {


    testWidgets ('Go to Settings' , 
    (WidgetTester tester) async {
      Preferences.language="es";
      await tester.pumpWidget(    
             makeTesteableWidget( child:   getWidget()  )         
          ) ;      
    
      var  t = getAppLocalizations(Preferences.language);       
  
      var popupMenuItem = find.byType(  PopupMenuButton ) ;      
      expect( popupMenuItem, findsOneWidget );

      //obrim el menú
      await tester.tap( popupMenuItem.first );
      await tester.pumpAndSettle();

      var settingsOption =  find.text( t.settingsTitle )  ;
      expect( settingsOption          , findsOneWidget);  

      // clickem la opció de settings
      await tester.tap( settingsOption.first );
      await tester.pumpAndSettle();

      // Mirem si estem a la pantalla de settings
      expect(find.text(t.settingsTitle)                      , findsOneWidget);
      expect(find.byType( SettingsScreen )                             , findsOneWidget);

      expect( find.bySemanticsLabel(t.darkmode)             , findsOneWidget);
      expect( find.bySemanticsLabel(t.language)                , findsOneWidget);
   } );

    testWidgets ('Go to Help' , 
    (WidgetTester tester) async {
      Preferences.language="es";
      await tester.pumpWidget(    
             makeTesteableWidget( child:   getWidget()  )         
          ) ;      
    
      var  t = getAppLocalizations(Preferences.language);       
  
      var popupMenuItem = find.byType(  PopupMenuButton ) ;      
      expect( popupMenuItem, findsOneWidget );

      //obrim el menú
      await tester.tap( popupMenuItem.first );
      await tester.pumpAndSettle();

      var helpOption =  find.text( t.helpTitle )  ;
      expect( helpOption          , findsOneWidget);  

      // clickem la opció de Help
      await tester.tap( helpOption.first );
      await tester.pumpAndSettle();

      // Mirem si estem a la pantalla de Help
      expect(find.text(t.helpTitle)                      , findsOneWidget);
      expect(find.byType( HelpScreen )                             , findsOneWidget);

      expect(  find.bySemanticsLabel( t.helpDescription1 ), findsWidgets);

   } );

    testWidgets ('Go to About' , 
    (WidgetTester tester) async {
      Preferences.language="es";
      await tester.pumpWidget(    
             makeTesteableWidget( child:   getWidget()  )         
          ) ;      
    
      var  t = getAppLocalizations(Preferences.language);       
  
      var popupMenuItem = find.byType(  PopupMenuButton ) ;      
      expect( popupMenuItem, findsOneWidget );

      //obrim el menú
      await tester.tap( popupMenuItem.first );
      await tester.pumpAndSettle();

      var aboutOption =  find.text( t.aboutTitle )  ;
      expect( aboutOption          , findsOneWidget);  

      // clickem la opció de Help
      await tester.tap( aboutOption.first );
      await tester.pumpAndSettle();

      // Mirem si estem a la pantalla de Help
      expect(find.text( t.aboutTitle)                              , findsOneWidget);
      expect(find.byType( AboutScreen )                             , findsOneWidget);

      expect( find.bySemanticsLabel("xavirambla.net")            , findsOneWidget);   
   } );


  
  });



  

/* -----------------------------------------------------------------------------------------------
   ------------------------------- Theme Test ----------------------------------------------
   ----------------------------------------------------------------------------------------------- */

  group ("Theme :" , () {

    testWidgets ('Settings - Change Theme' , 
    (WidgetTester tester) async {
      Preferences.language="en";
      await tester.pumpWidget(    
             makeTesteableWidget( child:   getWidget()  )         
          ) ;      
    
      var  t = getAppLocalizations(Preferences.language);       
  
      var popupMenuItem = find.byType(  PopupMenuButton ) ;      
      expect( popupMenuItem, findsOneWidget );

      //obrim el menú
      await tester.tap( popupMenuItem.first );
      await tester.pumpAndSettle();

      var settingsOption =  find.text( t.settingsTitle )  ;
      expect( settingsOption          , findsOneWidget);  

      // clickem la opció de settings
      await tester.tap( settingsOption.first );
      await tester.pumpAndSettle();

      // Mirem si estem a la pantalla de settings
      expect(find.text(t.settingsTitle)                      , findsOneWidget);
      expect(find.byType( SettingsScreen )                             , findsOneWidget);


      expect( find.bySemanticsLabel(t.darkmode)             , findsOneWidget);
      var switchListTile =  find.byType( SwitchListTile );
      expect( switchListTile, findsOneWidget );

      Text oldtext = tester.firstWidget( find.text('Dark Mode') );
      Color oldColor = oldtext.style?.color ?? Colors.red;   // cogemos el color actual del texto
      var oldMode = Preferences.isDarkmode;

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

  });


/* -----------------------------------------------------------------------------------------------
   ------------------------------- Functionality Test ----------------------------------------------
   ----------------------------------------------------------------------------------------------- */



  group ("Do it Some actions :" , () {

    testWidgets ('Settings - Change Theme' , 
    (WidgetTester tester) async {
      Preferences.language="es";
      await tester.pumpWidget(    
             makeTesteableWidget( child:   getWidget()  )         
          ) ;      
    
      var  t = getAppLocalizations(Preferences.language);       
  
      var popupMenuItem = find.byType(  PopupMenuButton ) ;      
      expect( popupMenuItem, findsOneWidget );

      //obrim el menú
      await tester.tap( popupMenuItem.first );
      await tester.pumpAndSettle();

      var settingsOption =  find.text( t.settingsTitle )  ;
      expect( settingsOption          , findsOneWidget);  

      // clickem la opció de settings
      await tester.tap( settingsOption.first );
      await tester.pumpAndSettle();

      // Mirem si estem a la pantalla de settings
      expect(find.text(t.settingsTitle)                      , findsOneWidget);
      expect(find.byType( SettingsScreen )                             , findsOneWidget);


      expect( find.bySemanticsLabel(t.darkmode)             , findsOneWidget);
      var switchListTile =  find.byType( SwitchListTile );
      expect( switchListTile, findsOneWidget );

      var oldMode = Preferences.isDarkmode;

      await tester.tap( switchListTile );   // cambiamos el modo Dark
      await tester.pump();
      expect ( Preferences.isDarkmode , !oldMode);   // Comprobamos que ya no mantenemos el mismo valor en Preferences

   } );


    testWidgets ('Basic' , 
    (WidgetTester tester) async {
      await tester.pumpWidget(    
             makeTesteableWidget( child:   getWidget()  )         
          ) ;      

      expect(  find.byType( HomeScreen ) , findsOneWidget);

      expect(  find.bySemanticsLabel('4') , findsOneWidget );
      expect(  find.bySemanticsLabel('+') , findsOneWidget );
      expect(  find.bySemanticsLabel('2') , findsOneWidget );
      expect(  find.bySemanticsLabel('=') , findsOneWidget );      

      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('+') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('2') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('=') );   // cambiamos el modo Dark
      await tester.pump();

      expect(  find.byKey( const ValueKey('cardline') ) , findsOneWidget );      

      Text result  = tester.firstWidget( find.byKey( const  ValueKey('cardline') ) ); 
      expect( result.data ,'6');

   } );



  });

}  

