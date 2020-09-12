import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'addPage.dart';


class TodoList extends StatefulWidget {

  final String nameAdd;
  final String descriptionAdd;

  const TodoList({Key key, this.nameAdd,this.descriptionAdd }): super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add, size: 30),
            tooltip: 'Add new file',
            onPressed: (){
             Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (BuildContext context) => AddPage(),
               ),
             );
            },
          ),
        ],
      ),

    );
  }
}
