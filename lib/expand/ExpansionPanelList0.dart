import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: ExpansionPanelListDemo(),
  ));
}

class ExpansionPanelListDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExpansionPanelListDemoState();
  }
}

class ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {
  var isExpanded;

  _expansionCallback(index ,isExpanded){
    setState(() {
      if(this.isExpanded==isExpanded){
        this.isExpanded=! this.isExpanded;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpansionPanelListDemo"),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, isOpened) {
            _expansionCallback(index,isOpened);
          },
          children: [
            ExpansionPanel(
              isExpanded: isExpanded,
              headerBuilder: (index, isExpanded) {
                return ListTile(
                  title: Text("更多内容"),
                );
              },
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                  height: 100.0,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.security,
                    size: 35.0,
                  ),
                ),
              ),

            )
          ],
        ),
      ),
    );
  }
}
