// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import '../configuration.dart';

void main() {


setUp(() async{
  confSetup();
  
});  

  group ("Home Screen" , () {
  
    // Nos facilita el widget a testear
    Widget getWidget(){
        return const  HomeScreen();
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
    expect(  find.byType( CardLine ) , findsOneWidget);
    expect(  find.byType( CardTable ) , findsOneWidget);

    
   } );


/* -----------------------------------------------------------------------------------------------
   ------------------------------- Translation Test ----------------------------------------------
   ----------------------------------------------------------------------------------------------- */
/*

Método para probar todos los textos del widget en el idioma seleccionado.
*/
  languageTest (){
        var  t = getAppLocalizations(Preferences.language);

     expect(find.text(t.homeTitle)                      , findsOneWidget);


  }

  menuTest ( tester ) async {
      var  t = getAppLocalizations(Preferences.language);

      var popupMenuItem = find.byType(  PopupMenuButton ) ;      
      expect( popupMenuItem, findsOneWidget );

      PopupMenuButton popupMenuItemObj = tester.firstWidget(  find.byType(  PopupMenuButton )  ) ;
      ClipOval clipOval = popupMenuItemObj.child as ClipOval ;
      var iconData = clipOval.child as Icon;

      expect( iconData.icon ,  const Icon(Icons.settings).icon );

      await tester.tap( popupMenuItem.first );
      await tester.pumpAndSettle();



     expect( find.text( t.helpTitle )               , findsOneWidget);
     expect( find.text( t.aboutTitle )              , findsOneWidget);
     expect( find.text( t.settingsTitle )           , findsOneWidget);     



  }

//-----------------------------------------------
    testWidgets ('English Text' ,
    (WidgetTester tester) async {
      Preferences.language="en";
      await tester.pumpWidget(
             makeTesteableWidget( child: getWidget()  )
          ) ;
        expect( find.bySemanticsLabel("Calculator")                    , findsOneWidget);
        languageTest ();
        menuTest ( tester );        

   } );

//-----------------------------------------------
    testWidgets ('Spanish Text' ,
    (WidgetTester tester) async {
      Preferences.language="es";
      await tester.pumpWidget(
             makeTesteableWidget( child: getWidget()  )
          ) ;
        expect( find.bySemanticsLabel("Calculadora")                    , findsOneWidget);
        languageTest ( );
        menuTest ( tester );        
   } );


    testWidgets ('Català Text' ,
    (WidgetTester tester) async {
      Preferences.language="ca";
      await tester.pumpWidget(
             makeTesteableWidget( child: getWidget()  )
          ) ;
        expect( find.bySemanticsLabel("Calculadora")                    , findsOneWidget);
        languageTest ( );
        menuTest ( tester );        
   } );

    testWidgets ('Français Text' ,
    (WidgetTester tester) async {
      Preferences.language="fr";
      await tester.pumpWidget(
             makeTesteableWidget( child: getWidget()  )
          ) ;
        expect( find.bySemanticsLabel("Calculatrice")                    , findsOneWidget);
        languageTest ( );
        menuTest ( tester );        
   } );



/* -----------------------------------------------------------------------------------------------
   ------------------------------- Functionality Test ----------------------------------------------
   ----------------------------------------------------------------------------------------------- */

//-----------------------------------------------
    testWidgets ('Functionality - Sum' ,
    (WidgetTester tester) async {
      Preferences.language="en";
      await tester.pumpWidget(
             makeTesteableWidget( child: getWidget()  )
          ) ;


      expect(  find.bySemanticsLabel('4') , findsOneWidget );
      expect(  find.bySemanticsLabel('+') , findsOneWidget );
      expect(  find.bySemanticsLabel('2') , findsOneWidget );
      expect(  find.bySemanticsLabel('=') , findsOneWidget );      

      await tester.tap( find.text('4') );   
      await tester.pump();

      await tester.tap( find.text('+') );   
      await tester.pump();

      await tester.tap( find.text('2') );   
      await tester.pump();

      await tester.tap( find.text('=') );   
      await tester.pump();

      expect(  find.byKey( const ValueKey('cardline') ) , findsOneWidget );      

      Text result  = tester.firstWidget( find.byKey( const  ValueKey('cardline') ) ); 
      expect( result.data ,'6');


   } );


   testWidgets ('Functionality - Rest' ,
    (WidgetTester tester) async {
      Preferences.language="en";
      await tester.pumpWidget(
             makeTesteableWidget( child: getWidget()  )
          ) ;


      expect(  find.bySemanticsLabel('4') , findsOneWidget );
      expect(  find.bySemanticsLabel('-') , findsOneWidget );
      expect(  find.bySemanticsLabel('3') , findsOneWidget );
      expect(  find.bySemanticsLabel('=') , findsOneWidget );      

      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('-') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('3') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('=') );   // cambiamos el modo Dark
      await tester.pump();

      expect(  find.byKey( const ValueKey('cardline') ) , findsOneWidget );      

      Text result  = tester.firstWidget( find.byKey( const  ValueKey('cardline') ) ); 
      expect( result.data ,'1');


   } );



    testWidgets ('Functionality - Mult' ,
    (WidgetTester tester) async {
      Preferences.language="en";
      await tester.pumpWidget(
             makeTesteableWidget( child: getWidget()  )
          ) ;


      expect(  find.bySemanticsLabel('4') , findsOneWidget );
      expect(  find.bySemanticsLabel('*') , findsOneWidget );
      expect(  find.bySemanticsLabel('2') , findsOneWidget );
      expect(  find.bySemanticsLabel('=') , findsOneWidget );      

      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('*') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('2') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('=') );   // cambiamos el modo Dark
      await tester.pump();

      expect(  find.byKey( const ValueKey('cardline') ) , findsOneWidget );      

      Text result  = tester.firstWidget( find.byKey( const  ValueKey('cardline') ) ); 
      expect( result.data ,'8');


   } );


    testWidgets ('Functionality - Mult Bigger' ,
    (WidgetTester tester) async {
      Preferences.language="en";
      await tester.pumpWidget(
             makeTesteableWidget( child: getWidget()  )
          ) ;


      expect(  find.bySemanticsLabel('4') , findsOneWidget );
      expect(  find.bySemanticsLabel('1') , findsOneWidget );      
      expect(  find.bySemanticsLabel('*') , findsOneWidget );
      expect(  find.bySemanticsLabel('2') , findsOneWidget );
      expect(  find.bySemanticsLabel('=') , findsOneWidget );      

      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.pump();
      await tester.tap( find.text('1') );   // cambiamos el modo Dark
      await tester.pump();      

      await tester.tap( find.text('*') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('2') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('=') );   // cambiamos el modo Dark
      await tester.pump();

      expect(  find.byKey( const ValueKey('cardline') ) , findsOneWidget );      

      Text result  = tester.firstWidget( find.byKey( const  ValueKey('cardline') ) ); 
      expect( result.data ,'82');


   } );


    testWidgets ('Functionality - Div' ,
    (WidgetTester tester) async {
      Preferences.language="en";
      await tester.pumpWidget(
             makeTesteableWidget( child: getWidget()  )
          ) ;

      expect(  find.bySemanticsLabel('8') , findsOneWidget );
      expect(  find.bySemanticsLabel('/') , findsOneWidget );
      expect(  find.bySemanticsLabel('2') , findsOneWidget );
      expect(  find.bySemanticsLabel('=') , findsOneWidget );      

      await tester.tap( find.text('8') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('/') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('2') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('=') );   // cambiamos el modo Dark
      await tester.pump();

      expect(  find.byKey( const ValueKey('cardline') ) , findsOneWidget );      

      Text result  = tester.firstWidget( find.byKey( const  ValueKey('cardline') ) ); 
      expect( result.data ,'4');


   } );


    testWidgets ('Functionality - Div with decimals' ,
    (WidgetTester tester) async {
      Preferences.language="en";
      await tester.pumpWidget(
             makeTesteableWidget( child: getWidget()  )
          ) ;

      expect(  find.bySemanticsLabel('8') , findsOneWidget );
      expect(  find.bySemanticsLabel('/') , findsOneWidget );
      expect(  find.bySemanticsLabel('5') , findsOneWidget );
      expect(  find.bySemanticsLabel('=') , findsOneWidget );      

      await tester.tap( find.text('8') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('/') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('5') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('=') );   // cambiamos el modo Dark
      await tester.pump();

      expect(  find.byKey( const ValueKey('cardline') ) , findsOneWidget );      

      Text result  = tester.firstWidget( find.byKey( const  ValueKey('cardline') ) ); 
      expect( result.data ,'1.6');


   } );



    testWidgets ('Functionality - Div with a lot of decimals' ,
    (WidgetTester tester) async {
      Preferences.language="en";
      await tester.pumpWidget(
             makeTesteableWidget( child: getWidget()  )
          ) ;

      expect(  find.bySemanticsLabel('8') , findsOneWidget );
      expect(  find.bySemanticsLabel('/') , findsOneWidget );
      expect(  find.bySemanticsLabel('3') , findsOneWidget );
      expect(  find.bySemanticsLabel('=') , findsOneWidget );      

      await tester.tap( find.text('8') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('/') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('3') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('=') );   // cambiamos el modo Dark
      await tester.pump();

      expect(  find.byKey( const ValueKey('cardline') ) , findsOneWidget );      

      Text result  = tester.firstWidget( find.byKey( const  ValueKey('cardline') ) ); 
      expect( result.data ,'2.666666666');


   } );


    testWidgets ('Functionality - Sum 3 numbers' ,
    (WidgetTester tester) async {
      Preferences.language="en";
      await tester.pumpWidget(
             makeTesteableWidget( child: getWidget()  )
          ) ;


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

      await tester.tap( find.text('+') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('2') );   // cambiamos el modo Dark
      await tester.pump();


      await tester.tap( find.text('=') );   // cambiamos el modo Dark
      await tester.pump();

      expect(  find.byKey( const ValueKey('cardline') ) , findsOneWidget );      

      Text result  = tester.firstWidget( find.byKey( const  ValueKey('cardline') ) ); 
      expect( result.data ,'8');


   } );


  testWidgets ('Functionality - OVERFLOW' ,
    (WidgetTester tester) async {
      Preferences.language="en";
      await tester.pumpWidget(
             makeTesteableWidget( child: getWidget()  )
          ) ;


      expect(  find.bySemanticsLabel('4') , findsOneWidget );

      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.pump();


      expect(  find.byKey( const ValueKey('cardline') ) , findsOneWidget );      

      Text result  = tester.firstWidget( find.byKey( const  ValueKey('cardline') ) ); 
      expect( result.data ,'OVERFLOW');


   } );


  testWidgets ('Functionality - OVERFLOW by operation' ,
    (WidgetTester tester) async {
      Preferences.language="en";
      await tester.pumpWidget(
             makeTesteableWidget( child: getWidget()  )
          ) ;


      expect(  find.bySemanticsLabel('4') , findsOneWidget );
      expect(  find.bySemanticsLabel('*') , findsOneWidget );
      expect(  find.bySemanticsLabel('2') , findsOneWidget );
      expect(  find.bySemanticsLabel('=') , findsOneWidget );      

      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.tap( find.text('4') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('*') );   // cambiamos el modo Dark
      await tester.pump();

      await tester.tap( find.text('2') );   // cambiamos el modo Dark
      await tester.tap( find.text('2') );   // cambiamos el modo Dark
      await tester.tap( find.text('2') );   // cambiamos el modo Dark
      await tester.tap( find.text('2') );   // cambiamos el modo Dark
      await tester.pump();



      await tester.tap( find.text('=') );   // cambiamos el modo Dark
      await tester.pump();

      expect(  find.byKey( const ValueKey('cardline') ) , findsOneWidget );      

      Text result  = tester.firstWidget( find.byKey( const  ValueKey('cardline') ) ); 
      expect( result.data ,'OVERFLOW');


   } );



  });
}
