import 'package:flutter/foundation.dart';

enum LanguageType{
  en(value:'en',label: "English"),
  es(value:'es',label: "Spanish"),
  fr(value:'fr',label: "French"),
  hi(value:'hi',label: "Hindi"),
  pt(value:'pt',label: "Portuguese");

  final String value;
  final String label;
   const LanguageType({
    required this.value,
    required this.label
  });
}