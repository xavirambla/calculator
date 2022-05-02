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

import '../../integration/configuration.dart';


void main() {

  group ("Calculator Provider : " , () {



    test("Constructor" ,() {
        final calculator = CalculatorProvider();
        expect(calculator.number,     "0");
        expect(calculator.oldNumber,  "");
        expect(calculator.action,     "");
    });

    test("Reset" ,() {
      
        final calculator = CalculatorProvider();
        calculator.number="4";
        calculator.oldNumber="4";
        calculator.action="+";
        calculator.reset();
        expect(calculator.number,     "0");
        expect(calculator.oldNumber,  "");
        expect(calculator.action,     "");
    });    

    test("Reset" ,() {

        final calculator = CalculatorProvider();
        calculator.number="4";
        calculator.oldNumber="4";
        calculator.action="+";
        calculator.reset();
        expect(calculator.number,     "0");
        expect(calculator.oldNumber,  "");
        expect(calculator.action,     "");
    });    


    test("Reset NotifyListeners" ,() {
      var calculator = CalculatorProvider();
      var isCalled = checkNotifierCalled(  calculator, () => CalculatorProvider() );
      expect(isCalled, isFalse );
      
      calculator = CalculatorProvider();
      isCalled = checkNotifierCalled(  calculator, () => calculator.reset() );
      expect(isCalled, isTrue );
    });    


    test("addNumber" ,() {
      var calculator = CalculatorProvider();
      calculator.addNumber( "4" );
      expect(calculator.number , "4");
      calculator.addNumber( "2" );
      expect(calculator.number , "42");
      calculator.number="0";
      calculator.addNumber( "9" );
      expect(calculator.number , "9");
      calculator.number="OVERFLOW";
      calculator.addNumber( "9" );
      expect(calculator.number , "9");
    });    


    test("addNumber Init" ,() {
      var calculator = CalculatorProvider();
      calculator.number="0";
      calculator.addNumber( "9" );
      expect(calculator.number , "9");

    });  

    test("addNumber Overflow" ,() {
      var calculator = CalculatorProvider();
      calculator.number="OVERFLOW";
      calculator.addNumber( "9" );
      expect(calculator.number , "9");
    });  


    test("addNumber NotifyListeners" ,() {
      var calculator = CalculatorProvider();
      var isCalled = checkNotifierCalled(  calculator, () => calculator.addNumber( "9" ) );
      expect(isCalled, isTrue );          
    });   

  });

  group ("Calculator Provider - Do actions : " , () {

    test("Insert two numbers" ,() {
      var calculator = CalculatorProvider();
      calculator.addNumber("4");
      calculator.doAction("+");
      calculator.addNumber("2");
      
      expect(calculator.number,     "2");
      expect(calculator.oldNumber,  "4");
      expect(calculator.action,     "+");

    });   



    test("Do it Operation" ,() {
      var calculator = CalculatorProvider();
      calculator.addNumber("4");
      calculator.doAction("+");
      calculator.addNumber("2");
      calculator.doAction("=");
      
      expect(calculator.number,     "6");
      expect(calculator.oldNumber,  "");
      expect(calculator.action,     "");

    }); 


    test("Sum Operation" ,() {
      var calculator = CalculatorProvider();
      calculator.addNumber("5");
      calculator.doAction("+");
      calculator.addNumber("3");
      calculator.doAction("=");
      
      expect(calculator.number,     "8");
      expect(calculator.oldNumber,  "");
      expect(calculator.action,     "");

    }); 

    test("Overflow by Number" ,() {
      var calculator = CalculatorProvider();
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");


      expect(calculator.number , "OVERFLOW");
    }); 

    test("Overflow Adding Number" ,() {
      var calculator = CalculatorProvider();
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");

      expect(calculator.number , "OVERFLOW");
      calculator.addNumber("3");
      expect(calculator.number , "3");


    });      

    test("Overflow Adding Operation" ,() {
      var calculator = CalculatorProvider();
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");

      expect(calculator.number , "OVERFLOW");
      calculator.doAction("-");
      expect(calculator.number , "OVERFLOW");
    });    


    test("Overflow Adding Reset" ,() {
      var calculator = CalculatorProvider();
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");

      expect(calculator.number , "OVERFLOW");
      calculator.reset();
      expect(calculator.number , "0");
    });        

    test("Overflow Continue Operation" ,() {
      var calculator = CalculatorProvider();
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");
      calculator.addNumber("3");

      expect(calculator.number , "OVERFLOW");
      calculator.addNumber("3");      
      calculator.doAction("-");
      calculator.addNumber("1");
      calculator.doAction("=");      
      expect(calculator.number , "2");
    });    



    test("Rest Operation" ,() {
      var calculator = CalculatorProvider();
      calculator.addNumber("5");
      calculator.doAction("-");
      calculator.addNumber("3");
      calculator.doAction("=");
      
      expect(calculator.number,     "2");
      expect(calculator.oldNumber,  "");
      expect(calculator.action,     "");

    }); 


    test("Mult Operation" ,() {
      var calculator = CalculatorProvider();
      calculator.addNumber("5");
      calculator.doAction("*");
      calculator.addNumber("3");
      calculator.doAction("=");
      
      expect(calculator.number,     "15");
      expect(calculator.oldNumber,  "");
      expect(calculator.action,     "");

    });     



    test("Division Operation" ,() {
      var calculator = CalculatorProvider();
      calculator.addNumber("6");
      calculator.doAction("/");
      calculator.addNumber("3");
      calculator.doAction("=");
      
      expect(calculator.number,     "2");
      expect(calculator.oldNumber,  "");
      expect(calculator.action,     "");

    });     

    test("Division Operation result in decimals" ,() {
      var calculator = CalculatorProvider();
      calculator.addNumber("3");
      calculator.doAction("/");
      calculator.addNumber("2");
      calculator.doAction("=");
      
      expect(calculator.number,     "1.5");
      expect(calculator.oldNumber,  "");
      expect(calculator.action,     "");
    });     



    test("Sum Operation" ,() {
      var calculator = CalculatorProvider();
      calculator.addNumber("5");
      calculator.doAction("+");
      calculator.addNumber("3");
      calculator.doAction("+");
      calculator.addNumber("4");

      calculator.doAction("=");
      
      expect(calculator.number,     "12");
      expect(calculator.oldNumber,  "");
      expect(calculator.action,     "");

    }); 


    test("Doble Equal Operation" ,() {
      var calculator = CalculatorProvider();
      calculator.addNumber("5");
      calculator.doAction("+");
      calculator.addNumber("3");
      calculator.doAction("+");
      calculator.addNumber("3");

      calculator.doAction("=");
      calculator.doAction("=");
      
      expect(calculator.number,     "11");
      expect(calculator.oldNumber,  "");
      expect(calculator.action,     "");

    }); 

    test("Doble Sum Operation" ,() {
      var calculator = CalculatorProvider();
      calculator.addNumber("5");
      calculator.doAction("+");
      calculator.addNumber("3");
      calculator.doAction("+");
      calculator.doAction("+");      
      calculator.addNumber("3");

      calculator.doAction("=");
      
      expect(calculator.number,     "11");
      expect(calculator.oldNumber,  "");
      expect(calculator.action,     "");

    }); 



    test("DoAction NotifyListeners" ,() {
      var calculator = CalculatorProvider();
      calculator.addNumber("3");
      var isCalled = checkNotifierCalled(  calculator, () => calculator.doAction("+") );
      expect(isCalled, isTrue );
      calculator.addNumber("2");
      isCalled = checkNotifierCalled(  calculator, () => calculator.doAction("=") );
      expect(isCalled, isTrue );
              
    });   



  });

}

