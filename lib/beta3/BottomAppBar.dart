import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List<BottomNavigationBarItem> items = new List();
  var currentIndex=1;
  onBottomNavigationBarClick(int index){

    setState(() {
      currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BottomAppBar"),),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 10.0,
        child: BottomNavigationBar(
          items: items,
          onTap: (index){
            onBottomNavigationBarClick(index);
          } ,
          currentIndex: currentIndex,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  @override
  void initState() {
    super.initState();

    items.add(new BottomNavigationBarItem(
        icon: Icon(Icons.cake), title: Text("cake")));
    items.add(new BottomNavigationBarItem(
        icon: Icon(Icons.message), title: Text("message")));
    items.add(new BottomNavigationBarItem(
        icon: Icon(Icons.person), title: Text("person")));
  }
}
