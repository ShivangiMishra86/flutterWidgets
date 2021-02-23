//import 'package:flutter/cupertino.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class FinancialCalculator extends StatefulWidget{
 Category _category;
 FinancialCalculator(Category category){
   _category=category;
 }
 @override
  State<StatefulWidget> createState() {
    return FinancialCalculatorState(_category);
  }

}

class FinancialCalculatorState extends State<FinancialCalculator>{
  Category _category;
  FinancialCalculatorState(Category category){
    _category=category;
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(_category.image_cap +" Calculator")
     ),
   body: Center(
     child:Hero(tag: _category,child: Image.asset(_category.image_loc,width:80.0,height: 80.0)),

 ),
       );
  }
}