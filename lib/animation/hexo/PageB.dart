import 'package:flutter/material.dart';

class PageB extends StatelessWidget {
  static var tag = "pageB";

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 80.0,
          ),
          Hero(
            tag: "hero",
            child: Container(
              child: Center(
                child: SizedBox(
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                  ),
                  width: 100.0,
                  height: 100.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "将 hero 从一个路由转移到另一个路由时，将其从圆形转换为矩形形状是平滑的效果，您可以使用 hero widget实现。为了实现这一点，代码为两个剪辑形状：圆形和方形的相交部分提供动画。在整个动画中，圆形剪辑（和图片）从minRadius放大到maxRadius，而方形剪辑大小保持不变。同时，图片从源路由中的位置飞到目标路由中的位置。有关此过渡的视觉示例，请参阅Material motion规范中的径向变换。",
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
          )
        ],
      ),
    );
  }
}
