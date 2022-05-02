
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../services/services.dart'  show ResponsiveService  ;

class ResponsiveTextSpan extends TextSpan {
  late TextStyle? style;

  ResponsiveTextSpan(
    {
    String? text,
    List<InlineSpan>? children,    
    TextStyle? style,
    GestureRecognizer? recognizer,
    MouseCursor? mouseCursor,
    void Function(PointerEnterEvent)? onEnter,
    void Function(PointerExitEvent)? onExit,
    String? semanticsLabel,
    Locale? locale,
    bool? spellOut,
} ) :
       super(
        text:text,
        children:children,
        style: ResponsiveService.getInstance().generateTextStyleResponsible ( style ), 
        recognizer:recognizer,
        mouseCursor:mouseCursor,
        onEnter:onEnter,
        onExit:onExit,
        semanticsLabel:semanticsLabel,
        locale:locale,
        spellOut: spellOut
        ) ; 
    

 

}
