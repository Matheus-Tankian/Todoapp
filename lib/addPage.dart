import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolist/TodoList.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  bool auxHeight = true;
  String name;
  String description;


  @override

  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    var heightSize = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Add',
        ),
      ),

      body: Container(
        color: Colors.indigo,
        height: (auxHeight? heightSize: 100),
        child: Wrap(
          alignment: WrapAlignment.center,
          //runAlignment: WrapAlignment.center,
          spacing: 20.0, // gap between adjacent chips
          runSpacing: 20.0,
          children: <Widget>[
            Expanded(
              child: titleView(),
            ),

            Expanded(
              child: Container(

                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: textViewName(),
              ),
              flex: 1,
            ),

            Expanded(
              child: Container(

                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: textViewDescription(),
              ),
              flex: 1,
            ),

            Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 200,
                    height: 60,
                    child: buttonView(),
                  ),
                ),
            ),

          ],
        ),
      )
    );
  }

  Widget titleView(){
    return Container(
      child: Center(
        child: Text(
          'Informe os dados',
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget textViewName(){
    return TextField(
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        textInputAction: TextInputAction.send,
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusedBorder:OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.white),
          ),
          enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          labelText: 'Name',
          labelStyle: new TextStyle(
            color: Colors.white,
          ),
        ),
        onChanged: (text){
          var aux  = text;
          if(aux !=null){
            setState(() {
              name = aux;
            });
          }
        }
    );
  }

  Widget textViewDescription(){
    return TextField(
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        textInputAction: TextInputAction.send,
        decoration:
        InputDecoration(
          focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          labelText: 'description',
          labelStyle: new TextStyle(
            color:Colors.white,
          ),
        ),
        onChanged: (text){
          var aux  = text;
          if(aux !=null){
            setState(() {
              description = aux;
            });
          }
        }
    );
  }

  Widget buttonView(){
    return FlatButton(
      onPressed: () {
        Navigator.pop(context,
            MaterialPageRoute(
                builder: (BuildContext context) => TodoList(nameAdd: name, descriptionAdd: description, )
            ));
      },
      textColor: Colors.white,
      color: Colors.blueAccent,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.white,
      highlightColor: Colors.orangeAccent,
      child: Text(
        'Send',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
