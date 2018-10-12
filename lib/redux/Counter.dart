import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

/// ------------------------------
/// ┌─┐┬ ┬ ┬┌─┐┬ ┬
/// ├┤ │ └┬┘│ ││ │
/// └  ┴─┘┴ └─┘└─┘
/// Author       : fzl flyou
/// Date         : 2018/10/11 0011
/// ProjectName  : test1
/// Description  :
/// Version      : V1.0
/// ------------------------------
enum Actions { Increment }
// The reducer, which takes the previous count and increments it in response
// to an Increment action.
int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    return state + 1;
  }

  return state;
}

void main() {
  Store<int> store = new Store<int>(counterReducer, initialState: 0);
  runApp(new MaterialApp(
    home: CounterDemo(store),
  ));
}

class CounterDemo extends StatelessWidget {
  final store;

  CounterDemo(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
      store: store,
      child: Scaffold(
        appBar: AppBar(
          title: Text("ReduxCounter"),
        ),
        body: Center(
          child: StoreConnector<int, String>(
            converter:(store){
              store.state.toString();
            } ,
            builder: (context, count) {
              return new Text(
                count,
                style: Theme.of(context).textTheme.display1,
              );
            },
          ),
        ),
        floatingActionButton:  new StoreConnector<int, VoidCallback>(
          converter: (store) {
            // Return a `VoidCallback`, which is a fancy name for a function
            // with no parameters. It only dispatches an Increment action.
            return () => store.dispatch(Actions.Increment);
          },
          builder: (context, callback) {
            return new FloatingActionButton(
              // Attach the `callback` to the `onPressed` attribute
              onPressed: callback,
              tooltip: 'Increment',
              child: new Icon(Icons.add),
            );
          },
        ),

      ),
    );
  }
}
