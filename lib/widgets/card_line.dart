import 'package:calculator/providers/providers.dart';
import 'package:calculator/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class CardLine extends StatefulWidget {
  CardLine({Key? key}) : super(key: key);

  @override
  State<CardLine> createState() => _CardLineState();
}

class _CardLineState extends State<CardLine> {

  @override
  Widget build(BuildContext context) {   

    final calculator = Provider.of<CalculatorProvider>(context, listen: true);

    return Container(
      margin: const EdgeInsets.all(10),   // lo quitamos del containter interior para ponero a fuera y así  quedea más fino.
      width: double.infinity,   
      child:ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
//          height:    80,
          height:   ResponsiveService.getInstance().getResponsiveHeightContainer( 100,  context : context  ),
          padding: const EdgeInsets.all(15),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: Colors.green[600],
            borderRadius: BorderRadius.circular(20)
          ),
          child: Text(  calculator.number  ,key: const ValueKey('cardline'), 
              style:  TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: ResponsiveService.getInstance().getResponsiveText(50,  context : context), 
//                         fontSize:    50,

                color: Colors.white) ),
        ),
      )
    );
  }
}

