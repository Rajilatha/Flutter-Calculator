import 'package:flutter/material.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget{
  Widget build(BuildContext contex){
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(
        primarySwatch:Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firnum;
  int secondnum;
  String texttodiplay ="";
  String res;
  String operationtoperform;
  void btnclicked(String btntext){
  if(btntext == "C"){
    texttodiplay ="";
    firnum= 0;
    secondnum =0;
    res = "";
  }else if(btntext == "+"|| btntext == "-" || btntext == "*" || btntext =="/"){
    firnum = int.parse(texttodiplay);
    res ="";
    operationtoperform = btntext;
  }
  else if(btntext == "="){
    secondnum = int.parse(texttodiplay);
    if(operationtoperform == "+"){
      res = (firnum +secondnum).toString();
    }
     if(operationtoperform == "-"){
      res = (firnum - secondnum).toString();
    }
     if(operationtoperform == "*"){
      res = (firnum * secondnum).toString();
    }
     if(operationtoperform == "~/"){
      res = (firnum / secondnum).toString();
    }
  }else{
    res = int.parse(texttodiplay +btntext).toString();
  }

  setState(() {
    texttodiplay = res;
  });
  }

   Widget custombutton(String btnval){
      return Expanded(child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed:() => btnclicked(btnval) ,
        child: Text(
          "$btnval",
          style:TextStyle(
            fontSize:25.0,
             ),
        ),
        ),
        );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
        ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "$texttodiplay",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
                ),
              Row(
                children: <Widget> [
               custombutton("9"),
               custombutton("8"),
               custombutton("7"),
               custombutton("+"),
              ],
              ),
               Row(
                children: <Widget> [
               custombutton("6"),
               custombutton("5"),
               custombutton("4"),
               custombutton("-"),
              ],
              ),
               Row(
                children: <Widget> [
               custombutton("3"),
               custombutton("2"),
               custombutton("1"),
               custombutton("*"),
              ],
              ),
               Row(
                children: <Widget> [
               custombutton("C"),
               custombutton("0"),
               custombutton("="),
               custombutton("/"),
              ],
              ),
            ],
          ),
        )
    );
  }
}