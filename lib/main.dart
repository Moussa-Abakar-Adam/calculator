import 'package:flutter/material.dart';
import 'button_values.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
            scaffoldBackgroundColor:const Color(
                0xffFCDBDB) ),

      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return  Scaffold(
      body:SafeArea(
      child: Column (
            children:  [
               Expanded(
                 child: SingleChildScrollView(
                   reverse: true,
                   child: Container(
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.all(16),
                    child: const Text("0",style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,),

                               ),
                 ),
               ),
            Wrap(
                children: Calculatricebtn.buttonValues.map((value) =>SizedBox(
                  width //: value == "AC"? screenSize.width /2
                      : value == "0"
                      ? screenSize.width /2
                      : screenSize.width / 4,
                  height:  screenSize.width /4.5,
                  child: buildButton(value),
                ),
                ).toList()
            ),
        ],
        ),
      ),);
  }
  Widget buildButton(value){
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: getBtnColor(value),
        shape: OutlineInputBorder(

            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius:
        BorderRadius.circular(25)),
        child: InkWell(
            onTap: () {},
            child:
        Center(child: Text(value , style:  const TextStyle(fontSize: 30),),),),
      ),
    );
  }
  Color getBtnColor (value){
    return [ Calculatricebtn.del, Calculatricebtn.clr,Calculatricebtn.parenthese].contains(value)? const Color(0xffFFB69F) :[
      Calculatricebtn.add,
      //Calculatricebtn.calculate,
      Calculatricebtn.divide,
      Calculatricebtn.multiply,
      Calculatricebtn.subtract
    ].contains(value)? const Color(       0xFFFFC623):
        [Calculatricebtn.calculate].contains(value)? const Color(0xFFFF8001):
    const Color(0xffffffff);
}

}
