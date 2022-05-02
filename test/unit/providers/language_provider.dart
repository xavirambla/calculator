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
 * @created 12/04/2022
 * @copyright Copyright (c) 2022 Xavi Rambla, https://xavirambla.net .
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/providers/providers.dart';


void main() {


  group ("Language Provider" , () {
    test("Number of Languages" ,() {
        final cantidad = LanguageProvider.languagemap.length;
        expect(cantidad,4);
    });

    test("getLanguages" ,() {
        final languages = LanguageProvider.getLanguages("es");
        expect(languages.length,4);
        final option = languages.keys.contains('Select a Language');
        expect(option ,false);
    });

    test("Check Languages  -> getLanguages" ,() {
        final languages = LanguageProvider.getLanguages("es");
        expect(languages.length,4);
        final option = languages.keys.contains('Select a Language');
        expect(option ,false);

        expect( languages.keys.contains('English') , true );
        expect( languages.keys.contains('Español') , true );
        expect( languages.keys.contains('Français') , true );
        expect( languages.keys.contains('Català') , true );


    });


    test("getLanguages EmptyLanguage" ,() {
        final languages = LanguageProvider.getLanguages("");
        expect(languages.length,5);
        final option = languages.keys.contains('Select Language');
        expect(option ,true);

    });



  });



    }      

