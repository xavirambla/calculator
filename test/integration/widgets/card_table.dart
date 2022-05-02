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

  group ("Card Table" , () {

    // Nos facilita el widget a testear
    Widget getWidget(){
        return    CardTable(   );
    }
      


//-----------------------------------------------
    testWidgets ('Basic' , 
    (WidgetTester tester) async {
      await tester.pumpWidget(    
             makeTesteableWidget( child:   getWidget() )         
          ) ;


    
    expect(  find.byType( Table ) , findsWidgets);

    Table table = tester.firstWidget( find.byType( Table ) );

    expect( table.children.length,4);     

    for ( var elem in table.children ){
      expect( elem.children!.length ,4); 
    }

   } );

    
    testWidgets ('Elements' , 
       (WidgetTester tester) async { 
          await tester.pumpWidget( 
             makeTesteableWidget( child:   getWidget() )   
         ); 

        expect(  find.bySemanticsLabel('0') , findsOneWidget );
        expect(  find.bySemanticsLabel('1') , findsOneWidget );
        expect(  find.bySemanticsLabel('2') , findsOneWidget );
        expect(  find.bySemanticsLabel('3') , findsOneWidget );
        expect(  find.bySemanticsLabel('4') , findsOneWidget );
        expect(  find.bySemanticsLabel('5') , findsOneWidget );
        expect(  find.bySemanticsLabel('6') , findsOneWidget );
        expect(  find.bySemanticsLabel('7') , findsOneWidget );
        expect(  find.bySemanticsLabel('8') , findsOneWidget );
        expect(  find.bySemanticsLabel('9') , findsOneWidget );
        expect(  find.bySemanticsLabel('+') , findsOneWidget );
        expect(  find.bySemanticsLabel('-') , findsOneWidget );
        expect(  find.bySemanticsLabel('*') , findsOneWidget );
        expect(  find.bySemanticsLabel('/') , findsOneWidget );
        expect(  find.bySemanticsLabel('C') , findsOneWidget );

    
    });






  });
}



