import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expand"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Container(
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(5.0)),
                    height: 100.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5.0,),
                        Text(
                          "个人中心",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                      child: Container(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              color: Colors.lightGreenAccent,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.audiotrack,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5.0,),
                              Text(
                                "音乐",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        )),
                        SizedBox(
                          height: 5.0,
                        ),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.movie,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5.0,),
                              Text(
                                "视频",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        )),
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                      child: Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Column(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                "电话",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        )),
                        SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              borderRadius: BorderRadius.circular(5.0)),
                              child: Column(

                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.textsms,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 5.0,),
                                  Text(
                                    "短信",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                        ))
                      ],
                    ),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
