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
      body:
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          textDirection: TextDirection.rtl,
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          children: <Widget>[
            MyButton("第1集"),
            MyButton("第2集"),
            MyButton("第3集"),
            MyButton("第4集"),
            MyButton("第5集"),
            MyButton("第6集"),
            MyButton("第7集"),
            MyButton("第8集"),
            MyButton("第9集"),
            MyButton("第10集"),
            MyButton("第11集"),

          ],

      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final text;

  MyButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(


        child: RaisedButton(
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
