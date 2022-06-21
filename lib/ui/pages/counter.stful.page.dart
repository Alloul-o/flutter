import 'package:flutter/material.dart';

class CounterStfulPage extends StatefulWidget {
  const CounterStfulPage({Key? key}) : super(key: key);

  @override
  State<CounterStfulPage> createState() => _CounterStfulPageState();
}

class _CounterStfulPageState extends State<CounterStfulPage> {
  int counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter Stful "),),
      body:  Center(
        child:  Text("Counter value => $counter"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed:(){
              setState(() {
                --counter;
              });
            },
            child: const Icon(Icons.remove) ,
          ),
          const SizedBox(width: 8,),
          FloatingActionButton(
            heroTag: null,
            onPressed:(){
              setState(() {
                ++counter;
              });

            },
            child: const Icon(Icons.add) ,
          )
        ],
      ),
    );
  }
}
