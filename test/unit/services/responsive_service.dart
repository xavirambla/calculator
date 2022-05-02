
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/services/services.dart';

import '../../integration/configuration.dart';


void main() {
    

  group( "Responsive Service", () {
    
    test("Create" ,() {
      ResponsiveService.create({}, {}, {}, {});

    });

    test("Get Instance" ,() {
      ResponsiveService.create({}, {}, {}, {});
      ResponsiveService instance = ResponsiveService.getInstance(); 
        expect( instance, isNotNull);
    });

    test("Same Instance" ,() {
      ResponsiveService.create({}, {}, {}, {});
      ResponsiveService instance = ResponsiveService.getInstance(); 

      ResponsiveService instance1 = ResponsiveService.getInstance(); 
        expect( instance, instance1 );
    });



    test("Create with TextCorrector" ,() {

      Map<String, dynamic> element = { "fr-widgetName-" : 10.0 };
      ResponsiveService.create( element , {}, {}, {});
      ResponsiveService instance = ResponsiveService.getInstance(); 
      expect( instance, isNotNull);
      expect( instance.textCorrector.isNotEmpty , true);
      expect ( instance.textCorrector.keys.contains("fr-widgetName-"),true);
    });


    test("Create with WidthCorrector" ,() {

      Map<String, dynamic> element = { "fr-widgetName-" : 10.0 };
      ResponsiveService.create( {},element , {}, {});
      ResponsiveService instance = ResponsiveService.getInstance(); 
      expect( instance, isNotNull);
      expect( instance.widthCorrector.isNotEmpty , true);
      expect ( instance.widthCorrector.keys.contains("fr-widgetName-"),true);
    });



    test("Create with HeightCorrector" ,() {

      Map<String, dynamic> element = { "fr-widgetName-" : 10.0 };
      ResponsiveService.create( {}, {},element , {});
      ResponsiveService instance = ResponsiveService.getInstance(); 
      expect( instance, isNotNull);
      expect( instance.heightCorrector.isNotEmpty , true);
      expect ( instance.heightCorrector.keys.contains("fr-widgetName-"),true);
    });


    test("Create with SizeCorrector" ,() {

      Map<String, dynamic> element = { "fr-widgetName-" : 10.0 };
      ResponsiveService.create( {}, {}, {},element );
      ResponsiveService instance = ResponsiveService.getInstance(); 
      expect( instance, isNotNull);
      expect( instance.sizeCorrector.isNotEmpty , true);
      expect ( instance.sizeCorrector.keys.contains("fr-widgetName-"),true);
    });


    test("Create with TextCorrector - Check correctors" ,() {

      Map<String, dynamic> element = { "fr-widgetName-" : 10.0 };
      ResponsiveService.create( element , {}, {} , {} );
      ResponsiveService instance = ResponsiveService.getInstance(); 
      expect( instance, isNotNull);
      expect( instance.textCorrector.isNotEmpty , true);
      expect ( instance.textCorrector.keys.contains("fr-widgetName-"),true);
      expect ( instance.widthCorrector.keys.contains("fr-widgetName-"),false);
      expect ( instance.heightCorrector.keys.contains("fr-widgetName-"),false);
      expect ( instance.sizeCorrector.keys.contains("fr-widgetName-"),false);      
    });


    test("Create with WidthCorrector - Check correctors" ,() {

      Map<String, dynamic> element = { "fr-widgetName-" : 10.0 };
      ResponsiveService.create( {},element , {}, {} );
      ResponsiveService instance = ResponsiveService.getInstance(); 
      expect( instance, isNotNull);
      expect( instance.widthCorrector.isNotEmpty , true);
      expect ( instance.widthCorrector.keys.contains("fr-widgetName-"),true);

      expect ( instance.textCorrector.keys.contains("fr-widgetName-"),false);
      expect ( instance.heightCorrector.keys.contains("fr-widgetName-"),false);
      expect ( instance.sizeCorrector.keys.contains("fr-widgetName-"),false);
    });



    test("Create with HeightCorrector - Check correctors" ,() {

      Map<String, dynamic> element = { "fr-widgetName-" : 10.0 };
      ResponsiveService.create( {}, {},element, {} );
      ResponsiveService instance = ResponsiveService.getInstance(); 
      expect( instance, isNotNull);
      expect( instance.heightCorrector.isNotEmpty , true);
      expect ( instance.heightCorrector.keys.contains("fr-widgetName-"),true);

      expect ( instance.textCorrector.keys.contains("fr-widgetName-"),false);
      expect ( instance.widthCorrector.keys.contains("fr-widgetName-"),false);
      expect ( instance.sizeCorrector.keys.contains("fr-widgetName-"),false);
    });




    test("Create with SizeCorrector - Check correctors" ,() {

      Map<String, dynamic> element = { "fr-widgetName-" : 10.0 };
      ResponsiveService.create( {}, {}, {},element );
      ResponsiveService instance = ResponsiveService.getInstance(); 
      expect( instance, isNotNull);
      expect( instance.sizeCorrector.isNotEmpty , true);
      expect ( instance.sizeCorrector.keys.contains("fr-widgetName-"),true);

      expect ( instance.textCorrector.keys.contains("fr-widgetName-"),false);
      expect ( instance.widthCorrector.keys.contains("fr-widgetName-"),false);
      expect ( instance.heightCorrector.keys.contains("fr-widgetName-"),false);

    });


/* 
Falla pq no tiene el context
    test("generateActionsIconThemeResponsible " ,() {

     IconThemeData? res  = ResponsiveService.getInstance().generateActionsIconThemeResponsible( const IconThemeData( size: 25, ) );
     expect( res, isNotNull);
    });
*/
    test("generateActionsIconThemeResponsible without style" ,() {

     IconThemeData? res  = ResponsiveService.getInstance().generateActionsIconThemeResponsible( null );
     expect( res, isNull);
    });

    test("generateActionsIconThemeResponsible without size" ,() {

     IconThemeData? res  = ResponsiveService.getInstance().generateActionsIconThemeResponsible( const IconThemeData( color: Colors.amber ) );
     expect( res, isNotNull);
    });

/*
Falla pq no tiene el context
    test("generateActionsIconThemeResponsible - Check correctors using widgetname" ,() {
      Preferences.language="fr";

      Map<String, dynamic> element = { "fr-widgetName-" : 10.0 };
      ResponsiveService.create( {}, {}, {},element );



     IconThemeData? res  = ResponsiveService.getInstance().generateActionsIconThemeResponsible( const IconThemeData( size: 25, ) );
     expect( res, isNotNull);

     IconThemeData? res1  = ResponsiveService.getInstance().generateActionsIconThemeResponsible( const IconThemeData( size: 25, ), widget: "widgetName" );
  // si son diferentes es que se ha realizado la corrección solciitada
    expect( res!=res1, true);


    });


    test("generateActionsIconThemeResponsible - Check correctors using key" ,() {
      Preferences.language="fr";

      Map<String, dynamic> element = { "fr--123" : 10.0 };
      ResponsiveService.create( {}, {}, {},element );



     IconThemeData? res  = ResponsiveService.getInstance().generateActionsIconThemeResponsible( const IconThemeData( size: 25, ) );
     expect( res, isNotNull);

     IconThemeData? res1  = ResponsiveService.getInstance().generateActionsIconThemeResponsible( const IconThemeData( size: 25, ), key: "123" );
  // si son diferentes es que se ha realizado la corrección solciitada
    expect( res!=res1, true);


    });
*/
/*
Falla pq no tiene el context
 
    test("generateTextStyleResponsible " ,() {

     TextStyle? res  = ResponsiveService.getInstance().generateTextStyleResponsible( const  TextStyle(fontSize: 10)  );
     expect( res, isNotNull);
    });

    test("generateTextStyleResponsible without style" ,() {

     TextStyle? res  = ResponsiveService.getInstance().generateTextStyleResponsible(  null );
     expect( res, isNull);
    });

    test("generateTextStyleResponsible without size" ,() {

     TextStyle? res  = ResponsiveService.getInstance().generateTextStyleResponsible( const  TextStyle(color: Colors.amber)  );
     expect( res, isNotNull);
    });


    test("generateTextStyleResponsible - Check correctors using widgetname" ,() {
      Preferences.language="fr";

      Map<String, dynamic> element = { "fr-widgetName-" : 10.0 };
      ResponsiveService.create( {}, {}, {},element );



    TextStyle? res  = ResponsiveService.getInstance().generateTextStyleResponsible( const  TextStyle(fontSize: 10)  );
     expect( res, isNotNull);

     TextStyle? res1  = ResponsiveService.getInstance().generateTextStyleResponsible( const  TextStyle(fontSize: 10), widget: "widgetName"  );
  // si son diferentes es que se ha realizado la corrección solciitada
    expect( res!=res1, true);


    });


    test("generateTextStyleResponsible - Check correctors using key" ,() {
      Preferences.language="fr";

      Map<String, dynamic> element = { "fr--123" : 10.0 };
      ResponsiveService.create( {}, {}, {},element );



    TextStyle? res  = ResponsiveService.getInstance().generateTextStyleResponsible( const  TextStyle(fontSize: 10)  );
     expect( res, isNotNull);

     TextStyle? res1  = ResponsiveService.getInstance().generateTextStyleResponsible( const  TextStyle(fontSize: 10), key: "123"  );
  // si son diferentes es que se ha realizado la corrección solciitada
    expect( res!=res1, true);


    });
*/
    
/*
     
    testWidgets('getResponsiveText', (WidgetTester tester) async {
      ResponsiveService.create( {}, {}, {} );
      await tester.pumpWidget(  makeTesteableWidget( child:   
        Builder(
          builder: (BuildContext context) {
     //  Preferences.language="es";            
   //        var newValue = ResponsiveService.getInstance().getResponsiveText(context, 10);    
              var newValue =10;        
            expect(newValue , 10);
            return const Text("");
          },
        ),
      ));
      
    });

*/

  });



}      

