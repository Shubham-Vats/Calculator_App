import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int firnum;
  int secondnum;
  String texttodisplay = "";
  String res;
  String operationtoperform;

  void btnclicked(String btntext) {
    if (btntext == "C") 
    {
      texttodisplay = "";
      firnum = 0;
      secondnum = 0;
      res = "";
    } 
    else if (btntext == "+" || btntext == "-" || btntext == "x" || btntext == "/") 
    {
      firnum = int.parse(texttodisplay);
      res = "";
      operationtoperform = btntext;
    } 
    else if (btntext == "=") 
    {
      secondnum = int.parse(texttodisplay);
      if (operationtoperform == "+") {
        res = (firnum + secondnum).toString();
      }
      if (operationtoperform == "-") {
        res = (firnum - secondnum).toString();
      }
      if (operationtoperform == "x") {
        res = (firnum * secondnum).toString();
      }
      if (operationtoperform == "/") {
        res = (firnum ~/ secondnum).toString();
      }
    } 
    else 
    {
      res = int.parse(texttodisplay + btntext).toString();
      // print(res);
    }

    setState(() {
      texttodisplay = res;
      print(btntext);
      // print(texttodiplay);
    });
  }

  Widget customButton(String btnval, Color color)
  {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20)
          ),
          child: OutlineButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            borderSide: BorderSide.none,
            padding: EdgeInsets.all(25.0),
            onPressed: () => btnclicked(btnval),
            child: Text(
              "$btnval",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white
              ),
            ),
          ),
        ),
      ) 
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: Text('CALCULATOR',style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w400,fontSize: 25.0,letterSpacing: 2.0),),
          centerTitle: true,
        ),
        body: Container(
          // color: Colors.grey[400],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 30,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:Text(
                        "$texttodisplay",
                        style: TextStyle(
                          fontSize: 52.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white      
                        ) ,
                        )
                    ),
                  ),
                )
              ),
              Row(
                children: <Widget>[
                 customButton("9", Colors.redAccent),
                 customButton("8", Colors.redAccent),
                 customButton("7", Colors.redAccent),
                 customButton("+", Colors.purple),
                ],
              ),
              Row(
                children: <Widget>[
                 customButton("6", Colors.redAccent),
                 customButton("5", Colors.redAccent),
                 customButton("4", Colors.redAccent),
                 customButton("-", Colors.purple),
                ],
              ),
              Row(
                children: <Widget>[
                 customButton("3", Colors.redAccent),
                 customButton("2", Colors.redAccent),
                 customButton("1", Colors.redAccent),
                 customButton("x", Colors.purple),
                ],
              ),
              Row(
                children: <Widget>[
                 customButton("C", Colors.purpleAccent),
                 customButton("0", Colors.purpleAccent),
                 customButton("=", Colors.purpleAccent),
                 customButton("/", Colors.purple),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}