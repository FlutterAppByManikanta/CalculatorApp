import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(CalculatorApplication());
}

class CalculatorApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator Application",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _CalculatorHomePageState();

}

class _CalculatorHomePageState extends State<CalculatorHomePage> {

  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();
  
  double result = 0;
  
  void performCalculation(String operator) {
    
    double num1 = double.tryParse(firstNumberController.text) ?? 0;
    double num2 = double.tryParse(secondNumberController.text) ?? 0;
    
    setState(() {
      
      switch(operator) {
        case '+' :
          result = num1 + num2;
          break;

        case '-' :
          result = num1 - num2;
          break;

        case '*' :
          result = num1 * num2;
          break;

        case '/' :
          result = num2 !=0 ? num1 / num2 : double.infinity;
          break;
      }
    });
    
    
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text("CalculatorApplication"),),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(height: 30,),


          // Enter First Number
          Container(
            margin: const EdgeInsets.only(left: 25,right: 25),
            child:  TextField(
              controller: firstNumberController,
              decoration: InputDecoration(labelText: "Enter First Number",border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
          ),

          SizedBox(height: 30,),
          // Enter Second Number


          Container(
            margin: const EdgeInsets.only(left: 25,right: 25),
            child:  TextField(
              controller: secondNumberController,
              decoration: InputDecoration(labelText: "Enter Second Number",border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
          ),

          SizedBox(height: 30,),


          // + - * /
          Container(
            margin: const EdgeInsets.only(left: 25,right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                ElevatedButton(onPressed: (){
                  performCalculation('+');

                  
                }, child: Text("+")),

                ElevatedButton(onPressed: (){
                  performCalculation('-');
                }, child: Text("-")),

                ElevatedButton(onPressed: (){
                  performCalculation('*');
                }, child: Text("*")),

                ElevatedButton(onPressed: (){
                  performCalculation('/');
                }, child: Text("/")),
              ],
            ),
          ),
          
          SizedBox(height: 25,),
          
          Container(
              margin: EdgeInsets.only(left: 25,right: 25),
              child: Center(child: Text("Result : $result",style: TextStyle(fontSize: 25),)))

          // Result

        ],
      ),
    );

  }

}
