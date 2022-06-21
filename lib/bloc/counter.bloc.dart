import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent{}

//events
class IncrementCounterEvent extends CounterEvent{

}

class DecrementCounterEvent extends CounterEvent{

}
//state
abstract class CounterState{
  final int counter;

  const CounterState({
    required this.counter,
});
}
 class CounterSuccesState extends CounterState{
  CounterSuccesState({required int counter}) : super(counter: counter);

 }
class CounterErrorState extends CounterState{

  final String errormassage;

  CounterErrorState({required int counter,required this.errormassage}) : super(counter: counter);

}

class CounterInitialState extends CounterState{
  CounterInitialState() : super(counter: 0);

}

//bloc
class CounterBloc extends Bloc<CounterEvent,CounterState>{
  CounterBloc() : super(CounterInitialState()){
    on((IncrementCounterEvent event, emit){
      if(state.counter<10){
        int countervalue=state.counter+1;
        emit(CounterSuccesState(counter:countervalue));
      }else{
        emit(CounterErrorState(counter: state.counter, errormassage: "value shoul d not exceed 10"));
      }
    });
    on((DecrementCounterEvent event, emit){
      if(state.counter>0){
        int countervalue=state.counter-1;
        emit(CounterSuccesState(counter:countervalue));
      }else{
        emit(CounterErrorState(counter: state.counter, errormassage: "value should not be bellow 0"));
      }
    });
  }

}