import 'dart:ui';

import 'package:calculator/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calculator/services/services.dart';
import '../share_preferences/preferences.dart';


/*
El blur es muy psado, mejor no ponerlo sino hace falta
*/
class CardTable extends StatefulWidget {
  CardTable({Key? key}) : super(key: key);

  @override
  State<CardTable> createState() => _CardTableState();
}

class _CardTableState extends State<CardTable> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context, listen: true ).currentTheme;

    Color colorNumbers =  currentTheme.primaryColor;
    //Color colorNumbers =  Preferences.isDarkmode ? Color.fromARGB(80, 228, 229, 236) : Colors.orange ;
    Color colorActions =  currentTheme.accentColor ;

//    Color colorActions =  Preferences.isDarkmode ? Colors.teal : Color.fromRGBO(62, 66, 107, 0.7) ;
    
    final calculator = Provider.of<CalculatorProvider>(context, listen: false);
    
    return Table(
      children: [
        TableRow(
          children: [
           _SingleCard(   text:'7'   ,  color: colorNumbers,  onTap: (){  calculator.addNumber("7"); }),
           _SingleCard(   text:'8'   , color: colorNumbers ,  onTap: (){  calculator.addNumber("8"); }),
           _SingleCard(   text:'9' , color: colorNumbers ,  onTap: (){    calculator.addNumber("9"); }),
           _SingleCard(   text:'*' , color: colorActions ,  onTap: (){    calculator.doAction("*"); }),

          ]
          ),
        TableRow(
          children: [
           _SingleCard(    text:'4' ,  color: colorNumbers,  onTap: (){   calculator.addNumber("4"); }),
           _SingleCard(   text:'5' ,  color: colorNumbers,  onTap: (){    calculator.addNumber("5"); }),
           _SingleCard(   text:'6' ,  color: colorNumbers,  onTap: (){    calculator.addNumber("6"); }),
           _SingleCard(   text:'/', color: colorActions ,  onTap: (){     calculator.doAction("/"); }),
          ]
          ),
        TableRow(
          children: [
           _SingleCard(   text:'1' ,  color: colorNumbers,  onTap: (){  calculator.addNumber("1"); }),
           _SingleCard(   text:'2' ,  color: colorNumbers,  onTap: (){  calculator.addNumber("2"); }),
           _SingleCard(   text:'3' ,  color: colorNumbers,  onTap: (){  calculator.addNumber("3"); }),
           _SingleCard(   text:'-', color: colorActions ,  onTap: (){   calculator.doAction("-"); }),              

          ]
          ),
        TableRow(
          children: [
           _SingleCard(   text:'C', color: colorActions ,  onTap: (){   calculator.reset(); }), 
           _SingleCard(   text:'0',  color: colorNumbers,  onTap: (){   calculator.addNumber("0"); }),
           _SingleCard(   text:'=', color: colorActions ,  onTap: (){   calculator.doAction("=");  }),
           _SingleCard(   text:'+', color: colorActions ,  onTap: (){   calculator.doAction("+"); }),

          ]
          ),
      ],

      );
  }
}


class _SingleCard extends StatelessWidget {
  final String text;
  final Color color;
  final onTap;


  _SingleCard({
    Key? key, 
    required this.text,
    required this.color, 
    required this.onTap
    }) : super(key: key);


  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context).currentTheme;
    //TextStyle styleText = currentTheme.textTheme.headline2!;
     TextStyle styleText =TextStyle( color: Colors.white ,fontWeight: FontWeight.bold, fontSize:ResponsiveService.getInstance().getResponsiveText( 70,  context : context) );
//     TextStyle styleText =TextStyle( color: Colors.white ,fontWeight: FontWeight.bold, fontSize:70 );
    // currentTheme.textTheme.bodyText2
    var column = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text( text ,style: styleText )
//                Text( text ,style:    TextStyle( color: Colors.white ,fontWeight: FontWeight.bold, fontSize: 50  ))
              ],);

    return _CardBackground(
      child: column,
      color: color,
      onTap: onTap,
      );
  }
}




//configura los widgets internos de la tarjeta
class _CardBackground extends StatelessWidget {
  final Widget child;
  final Color color;
  final onTap;

  const _CardBackground({ 
    Key? key, 
    required this.child,
    required this.color,
    required this.onTap

   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return GestureDetector(
      onTap: onTap,
      child: Container(
         margin: const EdgeInsets.all(10),   // lo quitamos del containter interior para ponero a fuera y así  quedea más fino.
        child: ClipRRect(   // se hace para que los widgets internos no ocupen más espacio que el asignado        
          borderRadius: BorderRadius.circular(20),  // mismo que el container interior.
          child: BackdropFilter(  // es ppara hacer un blur   ( )
            
            filter: ImageFilter.blur( sigmaX: 5 , sigmaY:5),
            
            child: Container(
      //          margin: EdgeInsets.all(15),
//              height: 100 ,
              height: ResponsiveService.getInstance().getResponsiveHeightContainer(100,  context : context ),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20)
              ),
              child: child
            ),
          ),
        ),
      ),
    );
  }
}







