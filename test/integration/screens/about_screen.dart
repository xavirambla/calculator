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

  group ("About Screen" , () {
  
    // Nos facilita el widget a testear
    Widget getWidget(){
        return const  AboutScreen();
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
    expect(  find.byType( CardContainer ) , findsOneWidget);
    
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

     expect(find.text( t.aboutTitle)                              , findsOneWidget);
     expect( find.bySemanticsLabel( t.author )   , findsOneWidget);  
     expect( find.bySemanticsLabel( t.version+" : " )                , findsOneWidget);  
     expect( find.bySemanticsLabel( t.buildNumber+" : " )  , findsOneWidget);  
     expect(find.bySemanticsLabel( t.copyright )          , findsOneWidget);
     expect( find.bySemanticsLabel("xavirambla.net")            , findsOneWidget);   

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
          expect(  find.bySemanticsLabel( t.author ), findsWidgets);
          RichText authorRichText = tester.firstWidget(  find.bySemanticsLabel( t.author )  ) ;
          TextSpan text = authorRichText.text as TextSpan;
          expect( text.style!.color, tema.textTheme.bodyText1!.color );
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

//-----------------------------------------------
    testWidgets ('Functionality - Launch URL' , 
    (WidgetTester tester) async {
      Preferences.language="en";
      await tester.pumpWidget(    
             makeTesteableWidget( child: getWidget()  )         
          ) ;

    
//    Text text =tester.firstWidget(find.text('Acerca de'));
  //  print(text);
//    var a = find.byType(RichText).evaluate().iterator;
  //  while ( a.moveNext()){
    //   print(a.current );
    //}
      

    var button =find.text('xavirambla.net'); 
    expect( button, findsOneWidget);
    await tester.tap(find.byType( MaterialButton ));
    await tester.pump();
   // await tester.pumpAndSettle();        
   } );



  
   } );

}

