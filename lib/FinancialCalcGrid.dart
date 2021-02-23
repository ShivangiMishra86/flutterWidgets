//import 'package:flutter/cupertino.dart';
//import 'package:flutter/foundation.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'main.dart';
class FinancialCalcGrid extends StatefulWidget{
 String _category;

  FinancialCalcGrid(String category){
    _category=category;
  }
  @override
  State<StatefulWidget> createState() {
    return FinancialCalcState(_category);
  }

}

class FinancialCalcState extends State<FinancialCalcGrid>{
 String _category;
  FinancialCalcState(String category){
    _category=category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_category +" Calculator")
      ),
      body: Center(
        child:Hero(tag: _category,child:Card(margin: const EdgeInsets.all(20.0),
            child: getCardByTitle(_category)
        ),),

      ),
    );
  }
}
Column getCardByTitle(String title) {
  String img="";

  if(title=="EMI Calculator")
  {img="assets/emi.png";
  }
  else if(title=="Wealth Calculator")
    img="assets/wealth.png";
  else if(title=="Events/Party")
    img="assets/event.png";
  else if(title=="Buying a car")
    img="assets/car.png";
  else if(title=="Child Education")
    img="assets/education.png";
  else if(title=="Retirement Corpus")
    img="assets/retirement.png";
  else if(title=="Vacation Corpus")
    img="assets/vacation.png";
  return Column(mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      new Center(child: Container(
        child: new Stack(
          children: <Widget>[

            new Image.asset(img,width:80.0,height: 80.0),
           // new Text(title,style: new TextStyle(fontSize: 20))
          ],
        ),
      ),)
    ],);
}
