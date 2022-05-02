
import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier{
  late String oldNumber;
  late String number;
  late String action;
    
    CalculatorProvider( ){ 
      reset( notify:false );
      }

/*  CalculatorProvider( ){
//    number="";
  }
*/
  void reset( {notify = true}){
    number      = "0";
    oldNumber   = "";
    action      = "";
    if (notify)    notifyListeners() ;  // avisa a todos los widgets que están escuchando
    
  }

  void addNumber(String number){
    if (this.number=="0" || this.number=="OVERFLOW"){
      this.number=number;
    }
    else  {
      this.number=this.number+number;
      if (this.number.length>12)       this.number="OVERFLOW";
    }

    //this.number = this.number.substring(1,14);  

    notifyListeners() ;  // avisa a todos los widgets que están escuchando
  }
  
  void _action( String action ){
      
      switch ( action ){
        case "+":
            number      = ( double.parse( number ) + double.parse( oldNumber )).toString() ; 
            break;
        case "-":
            number      = ( double.parse( oldNumber ) - double.parse( number )).toString() ;  
            break;
        case "*":
            number      = ( double.parse( number ) * double.parse( oldNumber )).toString() ;  
            break;
        case "/":
            final numberOperation = double.parse( oldNumber  ) / double.parse( number );
            number =  ( ( numberOperation * 1000000000 ).toInt() / 1000000000 ).toString();
            break;
        case "=":
            this.action   =   "";             
//            number = oldNumber;
  //          oldNumber     =   ""; 
            return;
            break;
        case "":
            return ;
            break;

        default:
            throw Exception("Operation not exists");      
      }
      oldNumber = "";   
  }

  void doAction(String action){
      final listOfActions=['+','-','*','/','='];
    // controles para rechazar realizar alguna acción
      if ( oldNumber=="OVERFLOW" || number=="OVERFLOW" )  return ;  // no hacemos nada
      if ( number.isEmpty ) return; // no operamos en caso de no tener datos
              
      
      if (  oldNumber.isEmpty  && action!="=" )   {
         // recolocamos los valores para posteriormente hacer los cálculos
         this.action = action;
         oldNumber   = number;
         number      = "";
      }
      else {
         if ( number.isEmpty || oldNumber.isEmpty ) return;   // en caso de faltar un valor , no hacemos nada
         
         _action( this.action );

         if (number!="")  {
           if  (double.parse( number ) %1 ==0 )
               number = number.replaceFirst(".0", "");   // quitamos los deciamles vacíos
          }    
         
         if ( number.length>12)      number = "OVERFLOW";   // revisamos los overflows

         if (action!="=")     {   
           this.action      =   action; 
           oldNumber        =   number;
           number           =   "";
           }
         else   this.action      = ""; 
         
      }

      notifyListeners() ;  // avisa a todos los widgets que están escuchando
  }




}