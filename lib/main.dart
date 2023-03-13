import 'package:flutter/material.dart';
import 'dart:ui';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home:const pagef(title:'Calculator'),
    );
  }
}

class pagef extends StatefulWidget {
  const pagef({Key? key, required this.title}) : super(key: key);
  // const pagef(super.key, required this.title);
  final String title;


  @override
  State<pagef> createState() => _pagefState();
}

// buttonPressed(){

// }

// //this widget is used to create buttons so that i have not to create those ones again and again

// Widget buildButton(String buttonText){
//   return  Expanded(
//     child:SizedBox(
//       height: 70.0,
//       child: Padding(padding: 
//       const EdgeInsets.all(2.0),
//       child: OutlinedButton(
//         onPressed: () => buttonPressed() , 
//         child: Text(buttonText ,style: const TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),),),
//       ),),
//   );
// }


class _pagefState extends State<pagef> {
//creating some variable to display output 
String output = '0';
String output2 = '0';
double num1 = 0;
double num2 = 0;
String operand = '';

//this function will be called when the calculator button is pressed
buttonPressed(buttonText){

    if(buttonText == 'CLEAR'){
        output2 = '0';
        num1 = 0;
        num2 = 0;
        operand = '0';
    }
    else if(buttonText == '+' || buttonText == '-' || buttonText == '/' || buttonText=='X'){
      num1 = double.parse(output);
      operand = buttonText;
      output2 = '0';
    }

    else if(buttonText == '.'){
      if(output2.contains('.')){
        print('ERROR: Decimal Already Present!!');
      }
      else{
        output2 += buttonText;
      }
    }
    else if(buttonText == "="){
      num2 = double.parse(output);
      if(operand == '+'){
        output2 = (num1+num2).toString();
      }
      if(operand == '-'){
        output2 = (num1-num2).toString();
      }
      if (operand == 'X'){
        output2 = (num1*num2).toString();
      }
      if(operand == '/'){
        output2 = (num1/num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand ='';
    }
    else{
      output2 += buttonText;
    }
    print(output2);
    setState(() {
      output = double.parse(output2).toStringAsFixed(2);
      print(output);
    });
}


//this widget is used to create buttons so that i have not to create those ones again and again

Widget buildButton(String buttonText){
  return  Expanded(
    child:SizedBox(
      height: 70.0,
      child: Padding(padding: 
      const EdgeInsets.all(2.0),
      child: OutlinedButton(
        onPressed: () => buttonPressed(buttonText), 
        child: Text(buttonText ,style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),),
      ),),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.title),
      ),

      body:Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(vertical: 24.0,horizontal: 12.0),
              child:  Text( output,
              style:const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),),
            ),
            const Expanded(
                child: Divider(color: Color.fromARGB(255, 136, 194, 242),
                thickness:2.0 ,),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        buildButton('7'),
                        buildButton('8'),
                        buildButton('9'),
                        buildButton('/'),
                      ],
                    ),
                    Row(
                      children: [
                        buildButton('4'),
                        buildButton('5'),
                        buildButton('6'),
                        buildButton('X'),
                      ],
                    ),
                    Row(
                      children: [
                        buildButton('1'),
                        buildButton('2'),
                        buildButton('3'),
                        buildButton('-'),
                      ],
                    ),
                    Row(
                      children: [
                        buildButton('.'),
                        buildButton('0'),
                        buildButton('00'),
                        buildButton('+'),
                      ],
                    ),
                    Row(
                      children: [
                        buildButton('Clear'),
                        buildButton('='),
                      ],
                    )
                  ],
                )
          ],
        ),
      ),
    );
  }
}
