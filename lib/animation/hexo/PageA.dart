import 'package:flutter/material.dart';
import 'package:test1/animation/hexo/PageB.dart';

void main() {
  final routes = <String, WidgetBuilder>{
    PageB.tag: (context) => PageB(),
  };

  runApp(new MaterialApp(
    home: PageA(),
    routes: routes,
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
                  color: Colors.red,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(PageB.tag);
                },
              ),
              width: 80.0,
              height: 80.0,
            ),
          ),
        ),
      ),
    );
  }
}
