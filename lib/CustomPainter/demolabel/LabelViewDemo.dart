import 'package:flutter/material.dart';
import 'package:test1/CustomPainter/demolabel/LableView.dart';

/// ------------------------------
/// ┌─┐┬ ┬ ┬┌─┐┬ ┬
/// ├┤ │ └┬┘│ ││ │
/// └  ┴─┘┴ └─┘└─┘
/// Author       : fzl flyou
/// Date         : 2018/10/24 0024
/// ProjectName  : test1
/// Description  :
/// Version      : V1.0
/// ------------------------------

void main() {
  runApp(new MaterialApp(
    home: LabelViewDemo(),
  ));
}

class LabelViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LabelViewDemo"),
      ),
      body: LabelView(
        Container(
          child: ListView(
            children: <Widget>[
              Image.asset(
                "images/cover.jpg",
                height: 120,
                width: 500,
                fit: BoxFit.cover,
                alignment: Alignment.topLeft,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "根据我们以前学过的知识不难发现，我们这里使用Stack时最好的，位于栈定的Widget会覆盖位于栈底的Widget。\n所以，我们把用于组合的子child放在栈底（第一个位置，优先入栈），把我们自定义的LabelView放在第二个位置，这样我们就实现了LabelView覆盖在子child上的效果。",
                style: TextStyle(height: 1.2),
              ),
              Divider(
                height: 2.0,
                color: Colors.grey,
              )
            ],
          ),
        ),
        Size(500, 240),
        labelText: "热销商品",
        labelColor: Colors.redAccent,
        labelAlignment: LabelAlignment.leftTop,
        useAngle: false,
      ),
    );
  }
}
