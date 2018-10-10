import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: ExpansionPanelListDemo(),
  ));
}

class ExpansionPanelListDemo extends StatefulWidget {
  @override
  _ExpansionPanelListDemoState createState() => _ExpansionPanelListDemoState();
}

class _ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {
  var currentPanelIndex = -1;
  List<int> mList;

  _ExpansionPanelListDemoState() {
    mList = new List();
    for (int i = 0; i < 10; i++) {
      mList.add(i);
    }
  }


  _setCurrentIndex(int index) {
    setState(() {

      if(currentPanelIndex==index){
        index=-1;
      }
      currentPanelIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ExpansionPanelList"),
        ),
        body: SingleChildScrollView(child: ExpansionPanelList(
          children: mList.map((index) {
            return new ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return new ListTile(
                  title: new Text('我是第$index个标题'),
                );
              },
              body: new Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(height: 100.0,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child:Icon(Icons.security,size: 35.0,),),
              ),
              isExpanded: currentPanelIndex == index,
            );
          }).toList(),

          expansionCallback: (index, bol) {
            _setCurrentIndex(index);
          },

        ),));
  }
}


