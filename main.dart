import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.green),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List Programming_Languages = [
    'Dart',
    'PHP',
    'Ruby',
    'Kotlin',
    'Rust',
    'C#',
    'JavaScript',
    'HTML',
    'CSS',
  ];

 late FixedExtentScrollController scrollController;
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    scrollController = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Changed to purple
        title: Center(child: Text('PROGLIST APP',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black),)),),
      body: Container(
        color: Colors.black, // Changed to orange
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.black, // Changed to light orange
                child: ListWheelScrollView(
                  controller: scrollController,
                  itemExtent:75,
                  //diameterRatio:0.5,
                  physics: FixedExtentScrollPhysics(),
                  children:Programming_Languages .map((Progamming_Languages) {
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue,
                             Colors.black,
                             Colors.blue
                             //Colors.red,
                               //Colors.black,
                             ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            Progamming_Languages,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.cyan,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child:
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  labelText: 'Enter a Programming language',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.blue),// Change label text color
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, // Change border color when focused
                  ),
                ),
                  ),
                style: TextStyle(color: Colors.blue), // Change text input color
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                     Programming_Languages.add(textController.text);
                      textController.clear();
                    });
                  },
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      Programming_Languages.removeLast();
                    });
                  },
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      Programming_Languages.shuffle();
                    });
                  },
                  child: Icon(Icons.shuffle),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
