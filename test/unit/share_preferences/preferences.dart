/*
 *
 * This is a basic Flutter to Test all Services of Application.
 *
 * To perform an interaction with a widget in your test, use the WidgetTester
 * utility that Flutter provides. For example, you can send tap and scroll
 * gestures. You can also use WidgetTester to find child widgets in the widget
 * tree, read text, and verify that the values of widget properties are correct.
 *
 * @package XaviRambla_Calculator
 * @author  Xavi xavirambla@yahoo.es
 * @created 12/04/2022
 * @copyright Copyright (c) 2022 Xavi Rambla, https://xavirambla.net .
 */




import '../../integration/configuration.dart';

void main(){


  group ("Share Preferences" , () {



    test("Constructor" ,() async {
        await Preferences.init();
       
//        final preferences = Preferences._prefs;
  //      expect(preferences, isNotNull);
       
        expect( Preferences.name ,       isNotNull);
        expect( Preferences.isDarkmode, isNotNull);
        expect( Preferences.language,   isNotNull);        
        expect( Preferences.gender,     isNotNull);
  
    });

    test("Check Name" ,() async {
        await Preferences.init();
       
        expect( Preferences.name ,       isNotNull);
        Preferences.name = "Test";
        expect( Preferences.name ,       "Test");
        Preferences.name = "Test1";
        expect( Preferences.name ,       "Test1");
        await Preferences.init();
        expect( Preferences.name ,       "Test1");
        Preferences.name = "";
  
    });

    test("Check isDarkmode" ,() async {
        await Preferences.init();
       
        expect( Preferences.isDarkmode ,       isNotNull);
        Preferences.isDarkmode = true ;
        expect( Preferences.isDarkmode ,       isTrue );
        Preferences.isDarkmode = false ;
        expect( Preferences.isDarkmode ,       isFalse );
        await Preferences.init();
        expect( Preferences.isDarkmode ,       isFalse );
  
    });


    test("Check Language" ,() async {
        await Preferences.init();
       
        expect( Preferences.language ,       isNotNull);
        Preferences.language = "en";
        expect( Preferences.language ,       "en");
        Preferences.language = "es";
        expect( Preferences.language ,       "es");
        await Preferences.init();
        expect( Preferences.language ,       "es");
  
    });


    test("Check Gender" ,() async {
        await Preferences.init();
       
        expect( Preferences.gender ,       isNotNull);
        Preferences.gender = 2 ;
        expect( Preferences.gender ,       2 );
        Preferences.gender = 1 ;
        expect( Preferences.gender ,       1 );
        await Preferences.init();
        expect( Preferences.gender ,       1 );
  
    });




  });
}
