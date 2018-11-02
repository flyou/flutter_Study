import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui' as skyui;

import 'package:flutter/rendering.dart' as sky;
import 'package:flutter/services.dart' as sky;
import 'package:flutter/widgets.dart' as sky;
import 'package:flutter/material.dart' as sky;
import 'package:flutter/painting.dart' as sky;

/// ------------------------------
/// ┌─┐┬ ┬ ┬┌─┐┬ ┬
/// ├┤ │ └┬┘│ ││ │
/// └  ┴─┘┴ └─┘└─┘
/// Author       : fzl flyou
/// Date         : 2018/10/12 0012
/// ProjectName  : test1
/// Description  :
/// Version      : V1.0
/// ------------------------------

void main() {
  runApp(new MaterialApp(
    home: PainterDemo(),
  ));
}

class PainterDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PainterDemoState();
  }
}

class PainterDemoState extends State<PainterDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PainterDemo"),
        ),
        body: DemoWidget());
  }
}

class DemoWidget extends sky.SingleChildRenderObjectWidget {
  @override
  sky.RenderObject createRenderObject(sky.BuildContext context) {
    return new DemoObject();
  }
}

class DemoObject extends sky.RenderConstrainedBox {
  double x = 50.0;
  double y = 50.0;
  skyui.Image image = null;

  DemoObject()
      : super(additionalConstraints: const sky.BoxConstraints.expand()) ;

  loadImage() async {
    if (image == null) {
      image = await ImageLoader.load("assets/icon.png");
      this.markNeedsPaint();
    }
  }

  @override
  bool hitTestSelf(sky.Offset position) => true;

  @override
  void handleEvent(sky.PointerEvent event, sky.BoxHitTestEntry entry) {}

  @override
  void paint(sky.PaintingContext context, sky.Offset offset) {
    loadImage();
    sky.Paint paint = new sky.Paint()
      ..color = new sky.Color.fromARGB(0xff, 0xff, 0xff, 0xff);
    sky.Offset point = new sky.Offset(x, y);
    if (image == null) {
      sky.Rect rect = new sky.Rect.fromLTWH(x, y, 50.0, 50.0);
      context.canvas.drawRect(rect, paint);
    } else {
      context.canvas.drawImage(image, point, paint);
    }
  }
}

class ImageLoader {
  static sky.AssetBundle getAssetBundle() => (sky.rootBundle != null)
      ? sky.rootBundle
      : new sky.NetworkAssetBundle(new Uri.directory(Uri.base.origin));

  static Future<skyui.Image> load(String url) async {
    sky.ImageStream stream = new sky.AssetImage(url, bundle: getAssetBundle())
        .resolve(sky.ImageConfiguration.empty);
    Completer<skyui.Image> completer = new Completer<skyui.Image>();
    void listener(sky.ImageInfo frame, bool synchronousCall) {
      final skyui.Image image = frame.image;
      completer.complete(image);
      stream.removeListener(listener);
    }

    stream.addListener(listener);
    return completer.future;
  }
}
