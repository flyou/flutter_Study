import 'package:flutter/material.dart';
import 'package:test1/animation/hexo/PageB.dart';

void main() {
  runApp(new MaterialApp(
    home: PageA(),
    debugShowCheckedModeBanner: false,
  ));
}

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "hero",
      child: Container(
        color: Colors.white,
        child: Align(
          alignment: Alignment.topCenter,
          child: Center(
            child: SizedBox(
              child: GestureDetector(
                child: Container(
                  child: new Image.asset("images/cover.jpg"),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    new MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return PageB();
                    }),
                  );
                },
              ),
              width: 280.0,
              height: 280.0,
            ),
          ),
        ),
      ),
    );
  }
}
