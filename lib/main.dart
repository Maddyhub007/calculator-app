import 'package:flutter/material.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatefulWidget {
 MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
 double size = 0;
String inputValue="";
String calculatedValue="";
String oper="";
  @override
  Widget build(BuildContext context) {
    size= MediaQuery.of(context).size.width/5;
    return  MaterialApp(
      home: Scaffold(
            backgroundColor: Colors.black,
            body: ListView(
              children: [
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(inputValue,
                  style: TextStyle(color: Colors.white,
                  fontSize: 100),),
                ),

                Column(
                  children: [
                    Row(
                      children: [
                        calculator("7",Colors.white38),
                        calculator("8",Colors.white38),
                        calculator("9",Colors.white38),
                        calculator("/",Colors.orange),
                      ],
                    ),
                    Row(
                      children: [
                        calculator("4",Colors.white38),
                        calculator("5",Colors.white38),
                        calculator("6",Colors.white38),
                        calculator("*",Colors.orange),
                      ],
                    ),
                    Row(
                      children: [
                        calculator("1",Colors.white38),
                        calculator("2",Colors.white38),
                        calculator("3",Colors.white38),
                        calculator("-",Colors.orange),
                      ],
                    ),
                    Row(
                      children: [
                        calculator("0",Colors.white38),
                        calculator(".",Colors.white38),
                        calculator("=",Colors.orange),
                        calculator("+",Colors.orange),
                      ],
                    ),
                  ],
                ),
                calculator("clear", Colors.black),
              ],
            ),
        ),
      );
    
  }

  Widget calculator(String text,Color bgcolor){
    return InkWell(
      onTap: (){

        if(text=="clear"){
          setState(() {
            inputValue="";
            calculatedValue="";
             oper="";
          });
          
        }else if(text=="+" || text=="-" || text=="*" || text=="/"){
          setState(() {
          calculatedValue=inputValue;
          inputValue="";
          oper=text;
          });
         
        }
        else if(text=="="){
          setState(() {

            double calc=double.parse(calculatedValue);
            double input=double.parse(inputValue);

            if(oper=="+"){
              inputValue=(calc+input).toString();
            }
            else if(oper=="-"){
              inputValue=(calc-input).toString();
            }
             else if(oper=="*"){
              inputValue=(calc*input).toString();
            }
             else if(oper=="/"){
              inputValue=(calc/input).toString();
            }

          });
          
        }
        else{
          setState(() {
          inputValue=inputValue+text;
        });
        }
        
      },
      child: Container(
                            decoration: BoxDecoration(
                              color: bgcolor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            margin: EdgeInsets.all(12),
                            height: size,
                            width: size,
                            alignment: Alignment.center,
                            child: Text(text,
                            style: TextStyle(color: Colors.white,fontSize: 34),),
                          ),
    );
  }
}
