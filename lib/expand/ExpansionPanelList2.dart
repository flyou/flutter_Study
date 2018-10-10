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

class ExpandStateBean{
  var isOpen;
  var index;
  ExpandStateBean(this.index,this.isOpen);
}

class _ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {
  var currentPanelIndex = -1;
  List<int> mList;
   List<ExpandStateBean> expandStateList;
  _ExpansionPanelListDemoState() {
    mList = new List();
    expandStateList=new List();
    for (int i = 0; i < 10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
  }


  _setCurrentIndex(int index,isExpand) {
    setState(() {
      expandStateList.forEach((item){
        if (item.index==index) {
          item.isOpen=!isExpand;
        }
      });

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
              isExpanded: expandStateList[index].isOpen,
            );
          }).toList(),

          expansionCallback: (index, bol) {
            _setCurrentIndex(index,bol);
          },

        ),));
  }
}


