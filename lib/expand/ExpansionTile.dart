
import 'package:flutter/material.dart';

class TwoLevelListDemo extends StatelessWidget {
  static const String routeName = '/material/two-level-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Expand/collapse list control')),
        body: ListView(
            children: <Widget>[
              const ListTile(title: Text('Top')),
              ExpansionTile(
                  title: const Text('Sublist'),
                  backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),

                  onExpansionChanged: (bool){
                  },
                  initiallyExpanded: true,
                  children: const <Widget>[
                    ListTile(title: Text('One')),
                    ListTile(title: Text('Two')),
                    // https://en.wikipedia.org/wiki/Free_Four
                    ListTile(title: Text('Free')),
                    ListTile(title: Text('Four'))
                  ]
              ),
              const ListTile(title: Text('Bottom'))
            ]
        )
    );
  }
}
void main(){
  runApp(MaterialApp(home: TwoLevelListDemo(),));
}