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
//this function will be called when the calculator button is pressed
buttonPressed(){

}

//this widget is used to create buttons so that i have not to create those ones again and again

// Widget bulidButton(){
//   return(
//
//   );
// }


class _pagefState extends State<pagef> {
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
              child: const Text('0',
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),),
            ),
            const Expanded(
                child: Divider(color: Color.fromARGB(255, 136, 194, 242),
                thickness:2.0 ,))
          ],
        ),
      ),
    );
  }
}
