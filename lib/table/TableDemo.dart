import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: TableDemo(),
  ));
}

class TableDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TableDemo"),
      ),
      body: Table(

        children: [
          TableRow(children: [
            TableCell(
                child: Container(
              child: Row(
                children: <Widget>[Text("ID"), Text("姓名")],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              height: 35.0,
              decoration: BoxDecoration(color: Colors.blueAccent),
            ))
          ]),
          TableRow(children: [
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[Text("000001"), Text("flyou")],
                  ),
                  height: 35.0,
                ))
          ]),
          TableRow(children: [
            TableCell(
              child: Container(
                  height: 35.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[Text("000002"), Text("jay11")],
                  )),
            )
          ]),
          TableRow(children: [
            TableCell(
                child: Container(child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[Text("000003"), Text("zhouc")],
                ),height: 35.0,))
          ]),
        ],
        border: TableBorder.all(color: Colors.lightBlue),
      ),
    );
  }
}
