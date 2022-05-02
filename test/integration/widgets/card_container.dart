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

  group ("Card Container" , () {

    // Nos facilita el widget a testear
    Widget getWidget(){
        return   const CardContainer(  child: Text("hola") , );
    }
      


//-----------------------------------------------
    testWidgets ('Basic' , 
    (WidgetTester tester) async {
      await tester.pumpWidget(    
             makeTesteableWidget( child:   getWidget() )         
          ) ;


    expect(  find.byType( Padding ) ,  findsWidgets);
    expect(  find.byType( Container ) , findsWidgets);


    
   } );



//-----------------------------------------------
    testWidgets ('Functionality - Get child' , 
    (WidgetTester tester) async {

      await tester.pumpWidget(    
             makeTesteableWidget( child: getWidget()  )         
          ) ;

      var text =  find.byType( Text );
      expect( text , findsOneWidget );
      Text component = tester.firstWidget( text  ) ;
      expect(  component.data , "hola");

    
   } );




   } );

}

