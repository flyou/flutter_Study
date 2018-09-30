import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap"),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.topCenter,
          child: Wrap(
        spacing: 10.0,
        runSpacing: 5.0,
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        children: <Widget>[
          MyButton("斗罗大陆"),
          MyButton("遮天"),
          MyButton("盗墓笔记"),
          MyButton("天龙八部"),
          MyButton("凡人修仙传"),
          MyButton("大主宰"),
          MyButton("仙逆"),
          MyButton("斗鱼"),
          MyButton("校花的贴身高手"),
          MyButton("酒神"),
          MyButton("最好的我们"),

        ],
      )),
    );
  }
}

class MyButton extends StatelessWidget {
  final text;

  MyButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 3.0, right: 3.0),
        child: OutlineButton(
          borderSide: BorderSide(
              color: Colors.blueAccent, width: 2.0, style: BorderStyle.solid),
          disabledBorderColor: Colors.grey,
          highlightedBorderColor: Colors.redAccent,
          onPressed: () {
            Scaffold.of(context).showSnackBar(new SnackBar(
              content: new Text(text),
              action: new SnackBarAction(
                label: "撤回",
                onPressed: () {},
              ),
            ));
          },
          child: Text(text),
        ));
  }
}
