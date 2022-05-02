import 'package:flutter/material.dart';

import '../services/services.dart'  show ResponsiveService  ;

class ResponsiveText extends Text {
  TextStyle? style;

  ResponsiveText(String data,
    {Key? key,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior} ) :
//    ) : super(data ); }

       super(data ,  
        key:key  ,
        style:style ,  
        strutStyle:strutStyle , 
        textAlign:textAlign, 
        textDirection:textDirection, 
        locale:locale , 
        softWrap:softWrap , 
        overflow:overflow, 
        textScaleFactor:textScaleFactor, 
        maxLines:maxLines, 
        semanticsLabel:semanticsLabel, 
        textWidthBasis:textWidthBasis, 
        textHeightBehavior:textHeightBehavior 
        ) ; 
    
    
  @override
  Widget build(BuildContext context) {
    if (super.style != null )      style = ResponsiveService.getInstance().generateTextStyleResponsible (  super.style!, context: context );
    return super.build(context) ;    
  }
 
 

}