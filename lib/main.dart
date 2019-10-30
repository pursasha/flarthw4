//Alexandra Gostev
//hw#4
//10/30/19
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter weight',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Flutter Planets Weight Calculator'),
    );
  }
  
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textCont;
  
  int weight;
  String plan;
  double calcWeight;

  @override
  void initState() { 
    textCont = new TextEditingController();
    weight =0;
    plan ='';
    calcWeight=0.0;
    super.initState();
  }

  calc(int w, String p)
  {
    Map<String, double> planetW =
    {
      "venus":0.78,
      "mars":0.39,
      "jupiter":2.65,
      "saturn":1.17,
      "uranus":1.05,
      "neptune":1.23
    };
    double answer= w*planetW[p];
    return answer;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children:<Widget>[ TextField
          (
            controller: textCont,
            style: TextStyle(fontSize:24, color: Colors.deepPurple),
            decoration: InputDecoration( labelText: 'Enter your weight on Earth'),
            cursorColor: Colors.deepPurple,
            onChanged:(text)
            {
              setState(() {
                this.weight= int.parse(text);
              });
            }
          ),
            Text(this.weight.toString(), style: TextStyle(fontSize:2)),
            Text("Select the planet you would like to visit", style: TextStyle(fontSize:20),),
            FlatButton(child: Text("Venus"), color: Colors.grey,
            onPressed:()
            {
              setState((){
                this.plan= "venus";
              });
            }
            ),
            FlatButton(child: Text("Mars"), color: Colors.grey,
            onPressed:()
            {
              setState((){
                this.plan= "mars";
              });
            }
            ),
            FlatButton(child: Text("Saturn"), color: Colors.grey,
            onPressed:()
            {
              setState((){
                this.plan= "saturn";
              });
            }
            ),
            FlatButton(child: Text("Neptune"), color: Colors.grey,
            onPressed:()
            {
              setState((){
                this.plan= "neptune";
              });
            }
            ),
            FlatButton(child: Text("Jupiter"), color: Colors.grey,
            onPressed:()
            {
              setState((){
                this.plan= "jupiter";
              });
            }
            ),
            FlatButton(child: Text("Uranus"), color: Colors.grey, highlightColor: Colors.pink,
            onPressed:()
            {
              setState((){
                this.plan= "uranus";
              });
            }
            ),
            Text("To get your weight on " + this.plan.toUpperCase()+ ", press calculate!", style: TextStyle(fontSize:24
            ),textAlign: TextAlign.center,),
            FlatButton(child: Text("Calculate" , style: TextStyle(fontSize: 45),), color: Colors.purple,
            onPressed:()
            {
              setState(() {
                this.calcWeight = calc(this.weight, this.plan);
              });
            }),
            Text("Your weight is " + this.calcWeight.toString(), style: TextStyle(fontSize:24),),
             ] 
        ),
      ),
      
    );
  }
}
