import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
//        leading: new Icon(Icons.account_circle),
        automaticallyImplyLeading: true,
        title: new Text("AppBar"),
        elevation: 10.0,
        backgroundColor: Colors.blueAccent,
      ),
      floatingActionButton: new MyFloatActionButton(),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new NetworkImage(
                            "http://t2.hddhhn.com/uploads/tu/201612/98/st93.png"))),
                accountName: new Text("flyou"),
                accountEmail: new Text("fangjaylong@gmail.com"),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new NetworkImage(
                      "http://tva2.sinaimg.cn/crop.0.3.707.707.180/a2f7c645jw8f6qvlbp1g7j20js0jrgrz.jpg"),
                )),
            new ListTile(
              leading: new Icon(Icons.refresh),
              title: new Text("刷新"),
            ),
            new ListTile(
              leading: new Icon(Icons.help),
              title: new Text("帮助"),
            ),
            new ListTile(
              leading: new Icon(Icons.chat),
              title: new Text("会话"),
            ),
            new ListTile(
              leading: new Icon(Icons.settings),
              title: new Text("设置"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[

          new BottomNavigationBarItem(
              icon: new Icon(Icons.shopping_cart), title: new Text("购物车")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.message), title: new Text("会话")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.person), title: new Text("我的")),
        ],
        fixedColor: Colors.blueAccent,
        currentIndex: 1,
      ),
    );
  }
}

class MyFloatActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FloatingActionButton(
      onPressed: () {
        final SnackBar snackbar = new SnackBar(
          content: new Text("Pressed Me"),
          action: new SnackBarAction(label: "UnDo", onPressed: () {}),
        );
        Scaffold.of(context).showSnackBar(snackbar);
      },
      child: new Icon(Icons.add),
      backgroundColor: Colors.blueAccent,
      mini: false,
      tooltip: "点我试试效果",
    );
  }
}
