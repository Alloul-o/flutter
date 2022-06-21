import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/bloc/counter.bloc.dart';
import 'package:flutter_project/ui/widgets/MainDrawer.widgets.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter Bloc "),),
      body:  Center(
        child: BlocBuilder<CounterBloc,CounterState>
          (
            builder: (context,state){
              if(state is CounterSuccesState || state is CounterInitialState )
              {
                return Text("Counter Value=>${state.counter}",
                    style: Theme.of(context).textTheme.headline5);
              }else if(state is CounterErrorState)
              {
                return Column
                  (
                     children: [
                     Text("Counter Value=>${state.counter}",
                         style: Theme.of(context).textTheme.headline5,),
                     Text("Counter Value=>${state.errormassage}",
                           style: Theme.of(context).textTheme.headline6)
                      ],
                  );
              }else
              {
                return Container();
              }
            },
        ) ,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "dec",
            onPressed: (){
              context.read<CounterBloc>().add(DecrementCounterEvent());
            },
            child:const Icon(Icons.remove),),
          const SizedBox(width: 8,),
          FloatingActionButton(
            heroTag: "inc",
            onPressed: (){
              context.read<CounterBloc>().add(IncrementCounterEvent());
            },
            child:const Icon(Icons.add),)
        ],
      ),
    );
  }
}
