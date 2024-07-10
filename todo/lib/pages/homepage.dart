import 'package:flutter/material.dart';
import 'package:todo/utils/todolist.dart'; // Ensure correct import path

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key); // Changed to use `Key? key` and `super(key: key)`

  @override
  _HomePageState createState() => _HomePageState(); // Corrected state class name
}

class _HomePageState extends State<HomePage> { // Corrected state class name and definition
  final _controller = TextEditingController();
  List<List<dynamic>> todolist = [ // Added type annotations for clarity
    ['Learn web development', false],
    ['Drink coffee', false], // Corrected capitalization
    ['Study', false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      todolist.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      todolist.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text("Simple To Do"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todolist.length,
              itemBuilder: (BuildContext context, int index) {
                return Todolist(
                  taskname: todolist[index][0], // Corrected taskname field
                  taskCompleted: todolist[index][1], // Corrected taskCompleted field
                  onChanged: (value) => checkBoxChanged(index),
                  deleteFunction: (context) => deleteTask(index),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter new task',
                      filled: true,
                      fillColor: Colors.deepPurple.shade200,
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Added spacing between TextField and FAB
                FloatingActionButton(
                  onPressed: saveNewTask,
                  child: Icon(Icons.add),
                  backgroundColor: Colors.deepPurple,
                ),
              ],
            ),
          ),
        ],
      ),
    ); // Scaffold
  }
}



