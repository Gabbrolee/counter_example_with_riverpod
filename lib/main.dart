import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main(){
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

final counterProvider = StateProvider( (ref)=> 0 );
class Home extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Example with riverpod'),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, _){
            final count = ref.watch(counterProvider.state).state;
            return Text('$count', style: TextStyle(fontSize: 40.0),);
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => ref.read(counterProvider.state).state++,
            tooltip: 'increment button',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10,),
          FloatingActionButton(
            onPressed: () => ref.read(counterProvider.state).state--,
            tooltip: 'decrement button',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
