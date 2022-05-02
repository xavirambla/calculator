// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'dart:io';

import '../configuration.dart';

void main() {
  

setUp(() async{
  confSetup();
   
  
});  

  group ("Card Line" , () {

    // Nos facilita el widget a testear
    Widget getWidget(){
        return    CardLine(   );
    }
      


//-----------------------------------------------
    testWidgets ('Basic' , 
    (WidgetTester tester) async {
      await tester.pumpWidget(    
             makeTesteableWidget( child:   getWidget() )         
          ) ;


    
    expect(  find.byType( Container ) , findsWidgets);
    expect(  find.byType( ClipRRect ) , findsWidgets);
    expect(  find.byType( Text ) ,      findsOneWidget);
 
    expect(   find.byKey( const ValueKey('cardline') ) ,      findsOneWidget);
    
   } );


testWidgets ('OVERFLOW' , 
    (WidgetTester tester) async {
      await tester.pumpWidget(    
             makeTesteableWidget( child:   getWidget() )         
          ) ;
    


    CalculatorProvider calculadora  = CalculatorProvider();
    var isCalled = checkNotifierCalled(  calculadora, () => calculadora.addNumber("455555555554") );
    expect(isCalled, isTrue );    

/*
    Text texto1 =   tester.firstWidget( find.byKey( const ValueKey('cardline') ) ) ;
    print(texto1.data);
    print(texto1);
    print(tester.toString());
    
    expect(texto1.data, "OVERFLOW");
  */ 

    });


    testWidgets ('Change Number' , 
    (WidgetTester tester) async {
      await tester.pumpWidget(    
             makeTesteableWidget( child:   getWidget() )         
          ) ;

    CalculatorProvider calculadora = CalculatorProvider();
    
//    Text text = tester.firstWidget( find.text('1111111') );

    

    Text texto =   tester.firstWidget( find.byKey( const ValueKey('cardline') ) ) ;
//    Text texto =   tester.firstWidget(find.byType( Text ) );
    expect(texto.data, "0");

      //calculadora.addNumber("44");
    var isCalled = checkNotifierCalled(  calculadora, () => calculadora.addNumber("44") );
    expect(isCalled, isTrue );
        /*
    //calculadora.number="44";
//    Text texto2 = tester.firstWidget( find.text('44') );
//    Text texto1 =   tester.firstWidget(find.byType( Text ) );
    Text texto1 =   tester.firstWidget( find.byKey( const ValueKey('cardline') ) ) ;
    print(texto1.data);
    print(texto1);
    
    expect(texto1.data, "44");
   */

   } );




  });
}  
