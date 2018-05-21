

import 'package:flutter/material.dart';

class BasicHeroAnimation extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text(' Hero Animation'),
      ),
      body: new Center(
        child: new InkWell(
          onTap: () {
            Navigator.of(context).push(
              new MaterialPageRoute<Null>(
                builder: (BuildContext context) {
                  return new Scaffold(
                    appBar: new AppBar(
                      title: const Text('Second Page'),
                    ),
                    body: new Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.topLeft,
                      // Use background color to emphasize that it's a new route.
                      color: Colors.lightBlueAccent,
                      child: new Hero(
                        tag: 'Hero',
                        child: new SizedBox(
                          width: 100.0,
                          child: new Image.asset(
                            'images/cover.jpg',
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
          // Main route
          child: new Hero(
            tag: 'Hero',
            child: new Image.asset(
              'images/cover.jpg',
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(home: new BasicHeroAnimation()));
}
