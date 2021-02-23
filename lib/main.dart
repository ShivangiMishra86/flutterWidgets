
import 'package:flutter/material.dart';
import 'package:flutter_app/calculator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/FinancialCalcGrid.dart';
void main() {
  runApp( MaterialApp(home:MyApp()));
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Financial Calculator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FcInterface());
  }
}

class FcInterface extends StatefulWidget {
  @override
  _FcInterfaceState createState() => _FcInterfaceState();
}

class _FcInterfaceState extends State<FcInterface> {
  List<String>calculators=["EMI Calculator",
  "Wealth Calculator",
  "Events/Party",
  "Buying a car",
  "Child Education",
  "Retirement Corpus",
  "Vacation Corpus"
] ;
  List<Widget> listtile=[

    Category(image_loc:'assets/emi.png',
      image_cap: 'EMI',)  ,
    Category(image_loc:'assets/wealth.png',
      image_cap: 'Wealth',),
    Category(image_loc:'assets/event.png',
      image_cap: 'Events',),
    Category(image_loc:'assets/car.png',
      image_cap: 'Car',),
    Category(image_loc:'assets/education.png',
      image_cap: 'Education',),
    Category(image_loc:'assets/retirement.png',
      image_cap: 'Retirement',),
    Category(image_loc:'assets/vacation.png',
      image_cap: 'Vacations',)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Financial Calculator Dashboard'),
          elevation: 0.0,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children:<Widget>[
            new Padding(padding: const EdgeInsets.all(8.0),
            child: new Text('Calculators List'),),

             HorizontalList(),
            new Padding(padding: const EdgeInsets.all(8.0),
              child: new Text('Calculators Grid'),),
        Container(
          /*margin: EdgeInsets.symmetric(vertical: 15),

          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(width: 100.0, color: Colors.blue[900]),
              Container(width: 100.0, color: Colors.green[900]),
              Container(width: 100.0, color: Colors.yellow[900]),
              Container(width: 100.0, color: Colors.purple[900]),
              Container(width: 100.0, color: Colors.blue),
              Container(width: 100.0, color: Colors.green),
              Container(width: 100.0, color: Colors.yellow),
              ListWheelScrollView(
                itemExtent: 10,
                children: listItems(context),
              ),
            ],
          ),*/
          height: 320.0,
         child: GridView(
           physics: BouncingScrollPhysics(),
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),
           children: calculators.map((title)
           {
             return  new Hero(tag: title, child:  GestureDetector(
               child:Card(margin: const EdgeInsets.all(20.0),
                   child: getCardByTitle(title)
               ),


               onTap:(){
                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => FinancialCalcGrid(
                         title ),

                   ),);
                 Fluttertoast.showToast(
                     msg:title,
                     toastLength:Toast.LENGTH_SHORT,
                     gravity:ToastGravity.BOTTOM,
                     backgroundColor:Colors.lightBlueAccent,
                     textColor:Colors.black87,
                     fontSize:16.0
                 );
               },),);
           }).toList(),
         ),

        ),

            new Padding(padding: const EdgeInsets.all(8.0),
              child: new Text('Calculators List Wheel'),),
    Container(
         margin: EdgeInsets.symmetric(vertical: 15),
         height: 450.0,
          child: ListWheelScrollView(
            magnification: 1.8,
            useMagnifier: true,
            itemExtent: 160,
            physics: FixedExtentScrollPhysics(),
            diameterRatio: 1.7,
            squeeze:  0.8,
          // onSelectedItemChanged: (index)=>{setState((){
            //_selectedItemIndex=index;})},
            children:listtile,
          ),),
            new Padding(padding: const EdgeInsets.all(6.0),
              child: new Text('These Are all About Financial Calculators'),),

            HorizontalList(), ]

    ),
    );

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
}

class HorizontalList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Container(
    height: 150.0,
    child: ListView(

      scrollDirection: Axis.horizontal,

    shrinkWrap: true,
      children: <Widget>[

        Category(image_loc:'assets/emi.png',
          image_cap: 'EMI',)  ,
        Category(image_loc:'assets/wealth.png',
          image_cap: 'Wealth',),
        Category(image_loc:'assets/event.png',
          image_cap: 'Events',),
        Category(image_loc:'assets/car.png',
          image_cap: 'Car',),
        Category(image_loc:'assets/education.png',
          image_cap: 'Education',),
        Category(image_loc:'assets/retirement.png',
          image_cap: 'Retirement',),
        Category(image_loc:'assets/vacation.png',
          image_cap: 'Vacations',)
      ] ,
    ),
  );
  }



}
class Category extends StatelessWidget{
  final String image_loc;
  String image_cap;


Category({this.image_loc,
this.image_cap});

  @override
  Widget build(BuildContext context) {
   return Padding(padding: const EdgeInsets.all(2.0),
   child:InkWell(onTap: (){



         Fluttertoast.showToast(
         msg:image_cap,
         toastLength:Toast.LENGTH_SHORT,
         gravity:ToastGravity.BOTTOM,
         backgroundColor:Colors.lightBlueAccent,
         textColor:Colors.black87,
         fontSize:16.0
     );
   },
   child: Hero(tag: Category(image_loc: image_loc,image_cap: image_cap), child: Container(
     width: 100.0,
     child: ListTile(
         title: Image.asset(image_loc,width:80.0,height: 80.0),
         subtitle: Text(image_cap)
           ),
        ),)

    ),
   );
  }

}



/*List<Widget> listItems(BuildContext context) {
  List<Widget> items = new List();
  Text('data');
  Text('Sales22');
  Text('sales55');
  Text('data');
  Text('Sales22');
  Text('sales55');
  Text('data');
  Text('Sales22');
  Text('sales55');
  Text('data');
  Text('Sales22');
  Text('sales55');

  return items;
}*/
//Solve this code by showing both the Grid Layout & the ListWheelScroll View.
//Hint: try making the size of the WheelScroll to Small heights.
// Use Hero Navigation tool to listItems.
//So, that whenever any user clicks on the listed item it will lead
//to the particular page let say to the different items of calculator.abstract
