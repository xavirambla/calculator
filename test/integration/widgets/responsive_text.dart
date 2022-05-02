// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:calculator/services/responsive_service.dart';

import '../configuration.dart';

void main() {


setUp(() async{
  confSetup();
  
});  

  group ("Responsive Text" , () {

    // Nos facilita el widget a testear
    Widget getWidget(){        
        return    ResponsiveText( "hola", style: const TextStyle(fontSize: 10.0) );
    }
      
    Widget getWidgetWithoutStyle(){        
        return    ResponsiveText( "hola1" );
    }


    Widget getWidgetWithoutFontSize(){        
        return    ResponsiveText( "hola2", style: const TextStyle( color: Colors.amber) );
    }
//-----------------------------------------------

    testWidgets ('Basic' , 
    (WidgetTester tester) async {
      BuildContext context ;
      ResponsiveService.create({},{}, {}, {} );
      await tester.pumpWidget(    
             makeTesteableWidget( child:   getWidget() )         
          ) ;
    
    expect(  find.byType( ResponsiveText ) , findsWidgets);



    } );

testWidgets ('Recalculate FontSize' , 
    (WidgetTester tester) async {
      ResponsiveService.create({},{}, {}, {} );
      await tester.pumpWidget(    
             makeTesteableWidget( child:   getWidget() )         
          ) ;
    
    expect(  find.byType( ResponsiveText ) , findsWidgets);
    ResponsiveText responsiveText = tester.firstWidget( find.byType( ResponsiveText ) );
    
    expect( responsiveText.style!.fontSize , isNonZero);
    expect( responsiveText.style!.fontSize , isNonNegative);
    expect( responsiveText.style!.fontSize , isNot(10));     //este puede fallar si la pantalla coincide con la medida elegida

    


    } );

    testWidgets ('Basic without style' , 
    (WidgetTester tester) async {
      ResponsiveService.create({},{}, {}, {} );
      await tester.pumpWidget(    
             makeTesteableWidget( child:   getWidgetWithoutStyle() )         
          ) ;
    
    expect(  find.byType( ResponsiveText ) , findsWidgets);
    ResponsiveText responsiveText = tester.firstWidget( find.byType( ResponsiveText ) );
    expect( responsiveText.style , isNull);

    } );

    testWidgets ('Basic without fontSize' , 
    (WidgetTester tester) async {
      ResponsiveService.create({},{}, {}, {} );
      await tester.pumpWidget(    
//             makeTesteableWidget( child:   getWidget() )         
             makeTesteableWidget( child:   getWidgetWithoutFontSize() )         
          ) ;
    
    expect(  find.byType( ResponsiveText ) , findsWidgets);
    ResponsiveText responsiveText = tester.firstWidget( find.byType( ResponsiveText ) );
    expect( responsiveText.style , isNotNull);
    expect( responsiveText.style!.fontSize , isNull);

    } );



   } );
}
